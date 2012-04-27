package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author kushagra gour a.k.a. chin chang
	 */
	public class Player extends Entity 
	{
		private var _target:Planet;
		private var _angle:Number;
		private var _sprite_map:Spritemap;
		private var _speed_tan:Number;
		private var _speed_tan_in_air:Number;
		private var _speed_rad:Number;
		private var _jump_speed:Number;
		private var _transition_speed:Number;
		private var _jumping:Boolean;
		private var _transiting:Boolean;
		private var _distance:Number;
		private var _half_height:int;
		private var _life:int;
		private var _sfx_jump:Sfx = new Sfx(Globals.SFX_JUMP);
		private var _sfx_transition:Sfx = new Sfx(Globals.SFX_TRANSITION);
		
		public function Player() 
		{
			_sprite_map = new Spritemap(Globals.SPR_PLAYER, 8, 12);
			super(0, 0, _sprite_map);
			this.type = 'player';
			this.name = 'player'
			_sprite_map.add('stand', [0], 0, false);
			_sprite_map.add('walk', [1, 2], 8, true);
			_sprite_map.centerOO();
			this.graphic = _sprite_map;
			_sprite_map.play('stand');
			
			setHitbox(8, 8);
			centerOrigin();
			
			_speed_tan = 150;
			_speed_tan_in_air = 70;
			_speed_rad = 0;
			_jump_speed = 250;
			_transition_speed = 100;
			_angle = 90;
			_jumping = true;
			_transiting = false;
			_half_height = 6;
			_life = 1;
		}
		
		override public function added():void 
		{
			// set a random target (planet to land)
			var planets:Array = [];
			world.getType('planet', planets);
			if(planets.length){
				var planet:Planet = FP.choose(planets);
				target = planet;
				_jumping = true;
			}
			TestWorld(world).life_txt.text = _life + '';
			super.added();
		}
		
		public function get target():Planet {
			return this._target;
		}
		
		public function set target(p:Planet):void {
			_target = p;
			_distance = FP.distance(x, y, _target.x, _target.y);
			_angle = FP.angle(_target.x, _target.y, this.x, this.y);
			_transiting = false;
			if (_distance < _target.radius + _half_height) putOnGround();
		}
		
		public function get jumping():Boolean {
			return _jumping;
		}
		
		public function set jumping(value:Boolean):void {
			_jumping = value;
		}
	
		override public function update():void 
		{			
			if (this._target) {
				// apply speeds
				if (_jumping && !_transiting) {
					_speed_rad += Globals.GRAVITY * FP.elapsed;
					_distance += _speed_rad * FP.elapsed;
				}
				else if (_transiting) {
					_distance += _transition_speed * FP.elapsed;
					_sprite_map.angle += 1000 * FP.elapsed;
				}
				
				// jump if not already jumping
				if ((Input.pressed(Key.Z) || Input.check(Key.SPACE)) && !_jumping && !_transiting) {
					_speed_rad = _jump_speed;
					_jumping = true;
					_sfx_jump.play();
				}
				
				// initatiate instant transmission
				else if (Input.pressed(Key.X) || Input.check(Key.CONTROL) || Input.check(Key.COMMAND)) {
					_transiting = !_transiting;
					if(_transiting)
						_sfx_transition.play();
					else
						_jumping = true;
				}
				
				// move
				if ((Input.check(Key.RIGHT) || Input.check(Key.D)) && !_transiting) {
					_angle -= (_jumping ? _speed_tan_in_air : _speed_tan) * FP.elapsed;
					_sprite_map.play('walk');
				}
				else if ((Input.check(Key.LEFT) || Input.check(Key.A)) && !_transiting) {
					_angle += (_jumping ? _speed_tan_in_air : _speed_tan) * FP.elapsed;
					_sprite_map.play('walk');
				}
				else {
					_sprite_map.play('stand');
				}
			
				// set angle according to target planet
				if (!_transiting)
					_sprite_map.angle = _angle - 90;
				
				// check for landing	
				if (_jumping && _distance < _target.radius + _half_height) {
					putOnGround();
				}	
				
				this.x = int(this._target.x + (_distance) * Math.cos(_angle * -FP.RAD));
				this.y = int(this._target.y - (_distance) * Math.sin(_angle * -FP.RAD));
				
			}
			super.update();
		}
		
		private function putOnGround():void {
			_distance = _target.radius + _half_height;
			_jumping = false;
			_speed_rad = 0;
		}
		
		public function damage(_amount:int):void {
			_life += _amount;
			TestWorld(world).life_txt.text = _life + '';
			if (!_life) TestWorld(world).gameOver();
		}
	}
}
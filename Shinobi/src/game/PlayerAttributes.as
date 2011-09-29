package game
{
    public class PlayerAttributes
    {
        public var hp:int;
        public var nin:int;
        public var gen:int;
        public var tai:int;
        public var agi:int;
        public var con:int;
        public var str:int;
        public var def:int;
        public var cog:int;
        public var intel:int;
        public var chk:int;
        public var stm:int;

        public function PlayerAttributes(values:Object)
        {
            hp = values.hp;
            nin = values.nin;
            gen = values.gen;
            tai = values.tai;
            agi = values.agi;
            con = values.con;
            str = values.str;
            def = values.def;
            cog = values.cog;
            intel = values.intel;
            chk = values.chk;
            stm = values.stm;
        }
    }
}

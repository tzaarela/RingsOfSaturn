class Player extends Entity 
{
    float fireCooldown;
    float health;
    float maxSpeed;
    float ammoLimit;
    float bulletSpeed;
    float damage;
    float jumpCooldown;
    boolean isDead;
    boolean isPlayable;
    Animation teleportAnimation;
    Animation spawnAnimation;

    PImage spriteLeft;
    PImage spriteRight;

    Powerup currentPowerup;


    Player (Ring currentRing) 
    {
        this.currentRing = currentRing;
        this.health = 100;
        this.size = 40;
        this.jumpCooldown = 250;
        this.fireCooldown = 150;
        this.isPlayable = true;
        this.sprite = Assets.sprites.get("Player");
        this.spriteLeft = Assets.sprites.get("PlayerTurnLeft");
        this.spriteRight = Assets.sprites.get("PlayerTurnRight");
    }

}
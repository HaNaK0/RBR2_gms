//the neighbors that exist
myNTiles[0] = noone
myCNTiles[0] = noone

//check tiles in all directions
nTiles[0] = collision_point(x +16 + 32, y +16, obj_tile, false, true) //E
nTiles[1] = collision_point(x +16, y +16 + 32, obj_tile, false, true) //S
nTiles[2] = collision_point(x +16 - 32, y +16, obj_tile, false, true) //W
nTiles[3] = collision_point(x +16, y +16 - 32, obj_tile, false, true) //N
nTiles[4] = collision_point(x +16 + 32, y +16 + 32, obj_tile, false, true) //SE
nTiles[5] = collision_point(x +16 - 32, y +16 + 32, obj_tile, false, true) //SW
nTiles[6] = collision_point(x +16 - 32, y +16 - 32, obj_tile, false, true) //NW
nTiles[7] = collision_point(x +16 + 32, y +16 - 32, obj_tile, false, true) //NE

for (i = 0 ; i < 8 ; i ++)
{
    if nTiles[i] != noone
    {
        if i < 4
        {
            myNTiles[array_length_1d(myNTiles) - 1] = i
            myNTiles[array_length_1d(myNTiles)] = noone
        }
        else
        {
            myCNTiles[array_length_1d(myCNTiles) - 1] = i
            myCNTiles[array_length_1d(myCNTiles)] = noone
        }
    }
}

/* positions in tileset
Left inner down (0, 0 - 32 * 32)
Underside (45, 0 - 32 * 34)
Right inner down (88, 0 - 32 * 32)
Right side (0, 43 - 34 * 32)
Left side (86, 43 - 34 * 32)
Left inner up (0, 85 - 32 * 32)
Uper side (45, 83 - 32 * 34)
Right inner up(88, 85 - 32 * 32)

Left upper corner (0, 129  -  34 * 34)
Right upper corner (54, 129 - 34 * 34)
Left lower corner (0,  177 - 34 * 34)
Right lower corner (54 ,  177 - 34 * 34)
*/ 

switch array_length_1d(myNTiles) - 1
{
case 0:
    // if no neighbors
    tile_add(ts_first, 45, 83, 32, 34, x, y - 2, -1)
    break;
case 1:
    //if one naighor i.e end of platforms and one block towers
    switch myNTiles[0]
    {
    case 0:
        tile_add(ts_first, 0, 129, 34, 34, x - 2, y - 2, -1)
        break;
    case 1:
        tile_add(ts_first, 45, 83, 32, 34, x, y - 2, -1)
        break;
    case 2:
        tile_add(ts_first, 54, 129, 34, 34, x, y - 2, -1)
        break;
    case 3:
        tile_add(ts_first, 43, 0 , 32, 34, x, y, -1)
        break;
    }
case 2:
    //if two neighbors
    switch myNTiles[0]
    {
    case 0:
        //first neighbor is east
        switch myNTiles[1]
        {
        case 1:
            //second neighbor is south
            //upper left corner
            if myCNTiles[0] == 4
            {
                //outer corner
                tile_add(ts_first, 0, 129, 34, 34, x - 2, y - 2, -1)
            }
            else
            {
                // platform bend
                //when i get the rest of the textures change this
                tile_add(ts_first, 0, 129, 34, 34, x - 2, y - 2, -1)
            }
            break;
        case 2:
            //second neighbor west
            //straight platform
            tile_add(ts_first, 45, 83, 32, 34, x, y - 2, -1)
            break;
        case 3:
            //second neighbor north
            //lower left corner
            if array_length_1d(myCNTiles) -1 == 0
            {
                tile_add(ts_first, 0, 177, 34, 34, x -2 , y, -1) //@todo: change when i have correct tileset
            }
            else if myCNTiles[array_length_1d(myCNTiles) -1] == 7
            {
                tile_add(ts_first, 0, 177, 34, 34, x -2 , y, -1)
            }
            else
            {
                tile_add(ts_first, 0, 177, 34, 34, x -2 , y, -1) //@todo: change when i have correct tileset
            }
            break;
        }
        break;
    case 1:
        //first neighbor south
        switch myNTiles[1]
        {
        case 2:
            //second neighbor west
            //upper right corner
            
            if array_length_1d(myCNTiles) -1 == 0 || array_length_1d(myCNTiles) -1 > 2
            {
                tile_add(ts_first, 54, 129, 34, 34, x, y - 2, -1) //@todo: change when i have correct tileset 
                break; //leaves the myNTiles[1] switch
            }
            
            myCNTiles[array_length_1d(myCNTiles)] = noone
            if myCNTiles[0] == 5 || myCNTiles[1]  == 5
            {
                tile_add(ts_first, 54, 129, 34, 34, x, y - 2, -1)
            }
            else
            {
                tile_add(ts_first, 54, 129, 34, 34, x, y - 2, -1) //@todo: change when i have correct tileset 
            }
            
        }
    }
    break;
}
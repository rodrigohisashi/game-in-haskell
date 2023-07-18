module Main where
import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game


data GameState = GameState
    { playerX :: Float
    , playerY :: Float
    , playerSpeed :: Float
    }

initialState :: GameState
initialState = GameState
    { playerX = 0
    , playerY = 0
    , playerSpeed = 5
    }

window :: Display
window = InWindow "Simple Game" (800, 600) (10, 10)

backgroundColor :: Color
backgroundColor = black

render :: GameState -> Picture
render game = pictures [player]
    where
        player = translate (playerX game) (playerY game) $ color blue $ rectangleSolid 20 20

handleInput :: Event -> GameState -> GameState
handleInput (EventKey (Char 'w') Down _ _) game = game { playerY = playerY game + playerSpeed game }
handleInput (EventKey (Char 's') Down _ _) game = game { playerY = playerY game - playerSpeed game }
handleInput (EventKey (Char 'a') Down _ _) game = game { playerX = playerX game - playerSpeed game }
handleInput (EventKey (Char 'd') Down _ _) game = game { playerX = playerX game + playerSpeed game }
handleInput _ game = game

update :: Float -> GameState -> GameState
update _ game = game

main :: IO ()
main = play window backgroundColor 60 initialState render handleInput update

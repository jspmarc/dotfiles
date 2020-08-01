--          _ __  __
--         | |  \/  |    Josep Macello
--      _  | | |\/| |    https://github.com/jspmarc
--     | |_| | |  | |    https://linkedin.com/in/josepmk1
--      \___/|_|  |_|
--
--

--  _    _ ______   _____  ______         _____
-- \ \  / /  ___ \ / ___ \|  ___ \   /\  (____ \
--  \ \/ /| | _ | | |   | | |   | | /  \  _   \ \
--   )  ( | || || | |   | | |   | |/ /\ \| |   | |
--  / /\ \| || || | |___| | |   | | |__| | |__/ /
-- /_/  \_\_||_||_|\_____/|_|   |_|______|_____/

{-============================================================================-}
-- Imports --
{-============================================================================-}

import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

{-============================================================================-}
-- Window Border --
{-============================================================================-}
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#569CD6"
myBorderWidth        = 2

{-============================================================================-}
-- Workspace --
{-============================================================================-}
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
myWorkspaces    = ["一","二","三","四","五","六","七","八","九","十"]

{-============================================================================-}
-- Layout --
{-============================================================================-}
myLayout = tiled ||| Mirror tiled ||| Full
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio   = 1/2

    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

{-============================================================================-}
-- Window rules --
{-============================================================================-}
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

{-============================================================================-}
-- Event handling --
{-============================================================================-}
myEventHook = mempty

{-============================================================================-}
-- Status bars and logging --
{-============================================================================-}
myLogHook = return ()

{-============================================================================-}
-- Startup hook --
{-============================================================================-}
myStartupHook = return ()

{-============================================================================-}
-- Keyboard binding --
{-============================================================================-}
myModMask       = mod4Mask -- mod4Mask is super left; mod1Mask is lef alt
supm            = mod1Mask

quitXmonad :: X()
quitXmonad = do
    let m = "yes"
    s <- spawn "~/script/rofi/powermenu/powermenu.sh" [m]
    when (m == s) (io exitSuccess)

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- terminal
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)
    -- app launcher
    , ((modm,                    xK_d), spawn "rofi -show drun")
    -- close window
    , ((modm .|. shiftMask,      xK_q), kill)
    -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
    -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    -- powermenu
    , ((controlMask.|.mod1Mask,  xK_q), quitXmonad)
    -- restart xmonad
    , ((modm.|.mod1Mask,         xK_r), spawn "xmonad --recompile; xmonad --restart")
    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b  ), sendMessage ToggleStruts)
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

{-============================================================================-}
-- Mouse binding --
{-============================================================================-}
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

{-============================================================================-}
-- Run xmonad --
{-============================================================================-}
main = xmonad defaults

{-============================================================================-}
-- Defaults --
{-============================================================================-}
myTerminal = "kitty"
defaults = def {
      -- simple stuff
        terminal            = myTerminal,
        focusFollowsMouse   = myFocusFollowsMouse,
        clickJustFocuses    = myClickJustFocuses,
        borderWidth         = myBorderWidth,
        modMask             = myModMask,
        workspaces          = myWorkspaces,
        normalBorderColor   = myNormalBorderColor,
        focusedBorderColor  = myFocusedBorderColor,

      -- key bindings
        keys                = myKeys,
        mouseBindings       = myMouseBindings,

      -- hooks, layouts
        layoutHook          = myLayout,
        manageHook          = myManageHook,
        handleEventHook     = myEventHook,
        logHook             = myLogHook,
        startupHook         = myStartupHook
    }

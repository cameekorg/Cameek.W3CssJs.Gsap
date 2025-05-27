@echo off
@echo.
@echo Download GSAP and Plugins
@echo =========================
@echo https://www.jsdelivr.com/package/npm/gsap
@echo.

:: Shorten the prompt temporarily
@prompt $S

:: Change to the script's directory
@pushd %~dp0

@echo Configuring Version and URLs
@echo ----------------------------
set VERSION=3.13.0
set BASE_URL=https://cdn.jsdelivr.net/npm/gsap@%VERSION%/dist

:: Core and Plugin URLs
set URL_GSAP=%BASE_URL%/gsap.min.js
set URL_DRAGGABLE=%BASE_URL%/Draggable.min.js
set URL_DRAWSVG=%BASE_URL%/DrawSVGPlugin.min.js
set URL_EASEL=%BASE_URL%/EaselPlugin.min.js
set URL_FLIP=%BASE_URL%/Flip.min.js
set URL_GSDEVTOOLS=%BASE_URL%/GSDevTools.min.js
set URL_INERTIA=%BASE_URL%/InertiaPlugin.min.js
set URL_MOTIONPATHHELPER=%BASE_URL%/MotionPathHelper.min.js
set URL_MOTIONPATH=%BASE_URL%/MotionPathPlugin.min.js
set URL_MORPHSVG=%BASE_URL%/MorphSVGPlugin.min.js
set URL_OBSERVER=%BASE_URL%/Observer.min.js
set URL_PHYSICS2D=%BASE_URL%/Physics2DPlugin.min.js
set URL_PHYSICSPROPS=%BASE_URL%/PhysicsPropsPlugin.min.js
set URL_PIXI=%BASE_URL%/PixiPlugin.min.js
set URL_SCRAMBLETEXT=%BASE_URL%/ScrambleTextPlugin.min.js
set URL_SCROLLTRIGGER=%BASE_URL%/ScrollTrigger.min.js
set URL_SCROLLSMOOTHER=%BASE_URL%/ScrollSmoother.min.js
set URL_SCROLLTO=%BASE_URL%/ScrollToPlugin.min.js
set URL_SPLITTEXT=%BASE_URL%/SplitText.min.js
set URL_TEXTP=%BASE_URL%/TextPlugin.min.js
set URL_EASEPACK=%BASE_URL%/EasePack.min.js
set URL_CUSTOMEASE=%BASE_URL%/CustomEase.min.js
set URL_CUSTOMBOUNCE=%BASE_URL%/CustomBounce.min.js
set URL_CUSTOMWIGGLE=%BASE_URL%/CustomWiggle.min.js

:: License (optional)
set URL_LICENSE=https://raw.githubusercontent.com/greensock/GSAP/master/LICENSE

@echo.
@echo.

@echo Configuring Target Directories and Files
@echo ----------------------------------------
set TARGET_WWW_DIR=../wwwroot
set TARGET_JS_DIR=%TARGET_WWW_DIR%/js
set TARGET_LICENSE=%TARGET_WWW_DIR%/LICENSE-gsap.txt

set TARGET_GSAP=%TARGET_JS_DIR%/gsap.min.js
set TARGET_DRAGGABLE=%TARGET_JS_DIR%/Draggable.min.js
set TARGET_DRAWSVG=%TARGET_JS_DIR%/DrawSVGPlugin.min.js
set TARGET_EASEL=%TARGET_JS_DIR%/EaselPlugin.min.js
set TARGET_FLIP=%TARGET_JS_DIR%/Flip.min.js
set TARGET_GSDEVTOOLS=%TARGET_JS_DIR%/GSDevTools.min.js
set TARGET_INERTIA=%TARGET_JS_DIR%/InertiaPlugin.min.js
set TARGET_MOTIONPATHHELPER=%TARGET_JS_DIR%/MotionPathHelper.min.js
set TARGET_MOTIONPATH=%TARGET_JS_DIR%/MotionPathPlugin.min.js
set TARGET_MORPHSVG=%TARGET_JS_DIR%/MorphSVGPlugin.min.js
set TARGET_OBSERVER=%TARGET_JS_DIR%/Observer.min.js
set TARGET_PHYSICS2D=%TARGET_JS_DIR%/Physics2DPlugin.min.js
set TARGET_PHYSICSPROPS=%TARGET_JS_DIR%/PhysicsPropsPlugin.min.js
set TARGET_PIXI=%TARGET_JS_DIR%/PixiPlugin.min.js
set TARGET_SCRAMBLETEXT=%TARGET_JS_DIR%/ScrambleTextPlugin.min.js
set TARGET_SCROLLTRIGGER=%TARGET_JS_DIR%/ScrollTrigger.min.js
set TARGET_SCROLLSMOOTHER=%TARGET_JS_DIR%/ScrollSmoother.min.js
set TARGET_SCROLLTO=%TARGET_JS_DIR%/ScrollToPlugin.min.js
set TARGET_SPLITTEXT=%TARGET_JS_DIR%/SplitText.min.js
set TARGET_TEXTP=%TARGET_JS_DIR%/TextPlugin.min.js
set TARGET_EASEPACK=%TARGET_JS_DIR%/EasePack.min.js
set TARGET_CUSTOMEASE=%TARGET_JS_DIR%/CustomEase.min.js
set TARGET_CUSTOMBOUNCE=%TARGET_JS_DIR%/CustomBounce.min.js
set TARGET_CUSTOMWIGGLE=%TARGET_JS_DIR%/CustomWiggle.min.js

@echo.
@echo.

@echo Creating Directories
@echo --------------------
if not exist "%TARGET_JS_DIR%" mkdir "%TARGET_JS_DIR%"
@echo.
@echo.

@echo Downloading Files
@echo -----------------
curl -o %TARGET_GSAP% %URL_GSAP%
curl -o %TARGET_DRAGGABLE% %URL_DRAGGABLE%
curl -o %TARGET_DRAWSVG% %URL_DRAWSVG%
curl -o %TARGET_EASEL% %URL_EASEL%
curl -o %TARGET_FLIP% %URL_FLIP%
curl -o %TARGET_GSDEVTOOLS% %URL_GSDEVTOOLS%
curl -o %TARGET_INERTIA% %URL_INERTIA%
curl -o %TARGET_MOTIONPATHHELPER% %URL_MOTIONPATHHELPER%
curl -o %TARGET_MOTIONPATH% %URL_MOTIONPATH%
curl -o %TARGET_MORPHSVG% %URL_MORPHSVG%
curl -o %TARGET_OBSERVER% %URL_OBSERVER%
curl -o %TARGET_PHYSICS2D% %URL_PHYSICS2D%
curl -o %TARGET_PHYSICSPROPS% %URL_PHYSICSPROPS%
curl -o %TARGET_PIXI% %URL_PIXI%
curl -o %TARGET_SCRAMBLETEXT% %URL_SCRAMBLETEXT%
curl -o %TARGET_SCROLLTRIGGER% %URL_SCROLLTRIGGER%
curl -o %TARGET_SCROLLSMOOTHER% %URL_SCROLLSMOOTHER%
curl -o %TARGET_SCROLLTO% %URL_SCROLLTO%
curl -o %TARGET_SPLITTEXT% %URL_SPLITTEXT%
curl -o %TARGET_TEXTP% %URL_TEXTP%
curl -o %TARGET_EASEPACK% %URL_EASEPACK%
curl -o %TARGET_CUSTOMEASE% %URL_CUSTOMEASE%
curl -o %TARGET_CUSTOMBOUNCE% %URL_CUSTOMBOUNCE%
curl -o %TARGET_CUSTOMWIGGLE% %URL_CUSTOMWIGGLE%
curl -o %TARGET_LICENSE% %URL_LICENSE%

@echo.
@echo.

:: Restore the previous directory
@popd

:: Reset the prompt to the default
@prompt

@echo.
@echo ===================================
@echo Finished downloading GSAP files
@echo.

@pause

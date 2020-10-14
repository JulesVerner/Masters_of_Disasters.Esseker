// dont display for JIP
if (didJIP) exitWith {
    missionNamespace setVariable ["UNMRE_introDone", true];
};

["CBA_loadingScreenDone", {
    [] spawn {
        player setVariable ["tf_voiceVolume", 0, true];
        diwako_dui_main_toggled_off = true;
        showChat false;
        5 fadeSound 1;

        private _goggles = goggles player;
        player setVariable ["UNMRE_gogglesCache", _goggles];
        player unlinkItem _goggles;

        titleText ["", "BLACK IN", 20];

        [] spawn GRAD_introCam_fnc_textEffects;

        private _shots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

        private _count = count _shots;
        {
            [_x, _forEachIndex] call GRAD_introCam_fnc_camCommands;
        } forEach _shots;


        cutText [" ", "BLACK IN", 3];
        private _camera = "camera" camCreate (getpos player);
        _camera cameraeffect ["terminate", "back"];
        camDestroy _camera;

        STHud_UIMode = 1;

        // 10 fadeSound 1;
        titleText ["", "BLACK IN", 0];
        player setVariable ["tf_voiceVolume", 1, true];
        diwako_dui_main_toggled_off = false;
        showChat true;
        player allowDamage true;
        missionNamespace setVariable ["UNMRE_introDone", true];

        private _goggles = player getVariable ["UNMRE_gogglesCache", objNull];
        player linkItem _goggles;
    };
}] call CBA_fnc_addEventHandler;
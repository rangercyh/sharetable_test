return {
    ["effect_action"] = {
        [1] = {
            ["test_func"] = function(print, t) print(t.aa, t.aa == "abc") end,
        },
        [1001] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.math.clamp(attacker:GetAttackNormal()-target:GetDefenceNormal(),0,10000) return result, {"subHpNormal",} end,
            ["action_id"] = 1001,
        },
        [1002] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.math.clamp(env.fixmath.floor(attacker:GetAttackNormal()-target:GetDefenceNormal()),0,10000) return result, {"subHpNormal",} end,
            ["action_id"] = 1002,
        },
        [1003] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addDefenceNormal=attacker:GetDefenceNormal()*0.25 return result, {"addDefenceNormal",} end,
            ["action_id"] = 1003,
        },
        [1004] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addAttackNormal=attacker:GetAttackNormal()*0.25 return result, {"addAttackNormal",} end,
            ["action_id"] = 1004,
        },
        [1005] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subDefenceNormal=target:GetDefenceNormal()*0.2 return result, {"subDefenceNormal",} end,
            ["action_id"] = 1005,
        },
        [1006] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addAttackSpeed=target:GetAttackSpeed()*0.4 return result, {"addAttackSpeed",} end,
            ["action_id"] = 1006,
        },
        [1007] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addSpeed=0.5 return result, {"addSpeed",} end,
            ["action_id"] = 1007,
        },
        [1008] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addShield=attacker:GetHpBase()*0.15 return result, {"addShield",} end,
            ["action_id"] = 1008,
        },
        [1009] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subDefenceNormal=target:GetDefenceNormal()*0.3 return result, {"subDefenceNormal",} end,
            ["action_id"] = 1009,
        },
        [1010] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addDefenceNormal=attacker:GetDefenceNormal()*0.3 return result, {"addDefenceNormal",} end,
            ["action_id"] = 1010,
        },
        [1011] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHurtRate=0.5 return result, {"subHurtRate",} end,
            ["action_id"] = 1011,
        },
        [1012] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.fixmath.floor((attacker:GetAttackNormal()-target:GetDefenceNormal())*2) return result, {"subHpNormal",} end,
            ["action_id"] = 1012,
        },
        [1013] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.fixmath.floor((attacker:GetAttackNormal()-target:GetDefenceNormal())*2.5) return result, {"subHpNormal",} end,
            ["action_id"] = 1013,
        },
        [1014] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.fixmath.floor((attacker:GetAttackNormal()-target:GetDefenceNormal())*3.5) return result, {"subHpNormal",} end,
            ["action_id"] = 1014,
        },
        [1015] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.dizziness = 1 return result, {"dizziness",} end,
            ["action_id"] = 1015,
        },
        [1016] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addAttackNormal=attacker:GetAttackNormal()*0.5 return result, {"addAttackNormal",} end,
            ["action_id"] = 1016,
        },
        [1017] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.fixmath.floor((attacker:GetAttackNormal()-target:GetDefenceNormal())*2) return result, {"subHpNormal",} end,
            ["action_id"] = 1017,
        },
        [1018] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.fixmath.floor((attacker:GetAttackNormal()-target:GetDefenceNormal())*1.5) return result, {"subHpNormal",} end,
            ["action_id"] = 1018,
        },
        [1019] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addAttackRange=3 return result, {"addAttackRange",} end,
            ["action_id"] = 1019,
        },
        [1020] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addSpeed=5 return result, {"addSpeed",} end,
            ["action_id"] = 1020,
        },
        [1021] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addBuff=attacker:Get("强化首次普攻", 1015);attacker:Set("强化首次普攻",false) return result, {"addBuff",} end,
            ["action_id"] = 1021,
        },
        [1022] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addAttackNormal=attacker:GetAttackNormal()*5 return result, {"addAttackNormal",} end,
            ["action_id"] = 1022,
        },
        [1023] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.fixmath.floor((attacker:GetAttackNormal()-target:GetDefenceNormal())*2) return result, {"subHpNormal",} end,
            ["action_id"] = 1023,
        },
        [1024] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.fixmath.floor((attacker:GetAttackNormal()-target:GetDefenceNormal())*6) return result, {"subHpNormal",} end,
            ["action_id"] = 1024,
        },
        [1025] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addBuff=attacker:Get("first_attack_fly", 1016);attacker:Set("first_attack_fly",false) return result, {"addBuff",} end,
            ["action_id"] = 1025,
        },
        [1026] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.fixmath.floor((attacker:GetAttackNormal()-target:GetDefenceNormal())*3) return result, {"subHpNormal",} end,
            ["action_id"] = 1026,
        },
        [1027] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addAttackNormal=target:GetAttackNormal() return result, {"addAttackNormal",} end,
            ["action_id"] = 1027,
        },
        [1028] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.fixmath.floor((attacker:GetAttackNormal()-target:GetDefenceNormal())*1.5) return result, {"subHpNormal",} end,
            ["action_id"] = 1028,
        },
        [1029] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addHp=attacker:GetAttackNormal() return result, {"addHp",} end,
            ["action_id"] = 1029,
        },
        [1030] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addDefenceNormal=attacker:GetDefenceNormal()*0.25 return result, {"addDefenceNormal",} end,
            ["action_id"] = 1030,
        },
        [1031] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.fixmath.floor((attacker:GetAttackNormal()-target:GetDefenceNormal())*3) return result, {"subHpNormal",} end,
            ["action_id"] = 1031,
        },
        [1032] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addAttackNormal=attacker:GetAttackNormal()*0.25 return result, {"addAttackNormal",} end,
            ["action_id"] = 1032,
        },
        [1033] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addAttackNormal=attacker:GetAttackNormal()*0.25 return result, {"addAttackNormal",} end,
            ["action_id"] = 1033,
        },
        [1034] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addHp=attacker:GetAttackNormal() return result, {"addHp",} end,
            ["action_id"] = 1034,
        },
        [1035] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subAttackNormal=attacker:GetAttackNormal()*0.2 return result, {"subAttackNormal",} end,
            ["action_id"] = 1035,
        },
        [1036] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addHp=attacker:GetAttackNormal()*0.8 return result, {"addHp",} end,
            ["action_id"] = 1036,
        },
        [1037] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subDefenceNormal=target:GetDefenceNormal()*0.2 return result, {"subDefenceNormal",} end,
            ["action_id"] = 1037,
        },
        [1038] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.fixmath.floor((attacker:GetAttackNormal()-target:GetDefenceNormal())*1.5) return result, {"subHpNormal",} end,
            ["action_id"] = 1038,
        },
        [1039] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.subHpNormal=env.fixmath.floor((attacker:GetAttackNormal()-target:GetDefenceNormal())*3) return result, {"subHpNormal",} end,
            ["action_id"] = 1039,
        },
        [99999] = {
            ["action"] = function (env, attacker, target, buff, effect, skill) local result = {}; result.addBuff=99999 return result, {"addBuff",} end,
            ["action_id"] = 99999,
        },
    },
}

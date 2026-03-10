# 04. 安全領域 (Safe Region)

**Phase 4: Migration Geometry**  
**Document ID:** `docs/80_geometry/04_Safe_Region.md`  
**Date:** 2026-03-05

---

## 1. はじめに

**安全領域** は、移行が許容可能と見なされる保証空間の部分集合である。変換 $T$ は、$G(T)$ がこの領域内にある場合にのみ **安全** である。

---

## 2. 形式的定義

### 2.1 安全領域

$$
\mathcal{S} = \{ (g_1, \dots, g_n) \in GS \mid g_i \ge \tau_i \quad \forall i \}
$$

ここで $\tau_i$ は次元 $i$ の **閾値** である。

### 2.2 閾値の例

| 次元 | 閾値 $\tau_i$ | 解釈 |
| :--- | :--- | :--- |
| Data Flow | 0.95 | データは95%保存されなければならない |
| State | 0.90 | 状態遷移は90%保存されなければならない |
| Transaction | 0.85 | トランザクション境界は85%保存されなければならない |

### 2.3 安全な移行

$$
T \text{ is Safe Migration} \iff G(T) \in \mathcal{S}
$$

---

## 3. 幾何学的解釈

安全領域は $GS$ 内の **超矩形**（またはオルサント）である：

$$
\mathcal{S} = [\tau_1, 1] \times [\tau_2, 1] \times \dots \times [\tau_n, 1]
$$

---

## 4. Phase 3 との関係

Phase 3 では安全領域を $G_{crit} \subseteq S$（離散）として定義した。Phase 4 ではこれを **連続的な閾値** で拡張する：

- Phase 3: 二値（安全/不安全）
- Phase 4: 段階的（安全の度合い）

---

## 5. 結論

安全領域 $\mathcal{S}$ は **許容可能な移行ゾーン** を定義する。移行パスが成功と見なされるためには、$\mathcal{S}$ 内に留まるか、到達しなければならない。

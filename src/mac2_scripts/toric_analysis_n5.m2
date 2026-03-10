-- Macaulay2 code for toric ideal analysis
-- Generated from graph_counter_v10_simplified.py
-- Analyzing graphs on n=5 vertices containing the chosen induced subgraph

-- ===== Graph 1 =====
-- Edges: [(0, 2), (0, 3), (1, 2), (1, 3)]
-- Canonical form: ((0, 1), (0, 2), (1, 3), (2, 3))

-- Create a polynomial ring for edges
R1 = QQ[x1, x2, x3, x4];

-- Create a polynomial ring for vertices
S1 = QQ[t1, t2, t3, t4];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t2*t3  (edge {2,3})
-- x4 -> t2*t4  (edge {2,4})

phi1 = map(S1, R1, {t1*t3, t1*t4, t2*t3, t2*t4});

-- The toric ideal is the kernel of this map
I1 = kernel phi1;

J1 = ideal mingens I1;

-- Print results (using minimal generating set)
print("Graph 1: ");
print("  Regularity = " | toString(regularity I1));
print("  Number of generators (mingens) = " | toString(numgens J1));
print("  Degrees of generators (mingens) = " | toString(degrees J1));
print("  Minimal generators: " | toString J1);

--------------------------------------------------

-- ===== Graph 2 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (1, 2), (1, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 4), (2, 4))

-- Create a polynomial ring for edges
R2 = QQ[x1, x2, x3, x4, x5];

-- Create a polynomial ring for vertices
S2 = QQ[t1, t2, t3, t4, t5];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t4  (edge {2,4})

phi2 = map(S2, R2, {t1*t3, t1*t4, t1*t5, t2*t3, t2*t4});

-- The toric ideal is the kernel of this map
I2 = kernel phi2;

J2 = ideal mingens I2;

-- Print results (using minimal generating set)
print("Graph 2: ");
print("  Regularity = " | toString(regularity I2));
print("  Number of generators (mingens) = " | toString(numgens J2));
print("  Degrees of generators (mingens) = " | toString(degrees J2));
print("  Minimal generators: " | toString J2);

--------------------------------------------------

-- ===== Graph 3 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 4), (2, 4), (3, 4))

-- Create a polynomial ring for edges
R3 = QQ[x1, x2, x3, x4, x5, x6];

-- Create a polynomial ring for vertices
S3 = QQ[t1, t2, t3, t4, t5];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})

phi3 = map(S3, R3, {t1*t3, t1*t4, t1*t5, t2*t3, t2*t4, t2*t5});

-- The toric ideal is the kernel of this map
I3 = kernel phi3;

J3 = ideal mingens I3;

-- Print results (using minimal generating set)
print("Graph 3: ");
print("  Regularity = " | toString(regularity I3));
print("  Number of generators (mingens) = " | toString(numgens J3));
print("  Degrees of generators (mingens) = " | toString(degrees J3));
print("  Minimal generators: " | toString J3);

--------------------------------------------------

-- ===== Graph 4 =====
-- Edges: [(0, 1), (0, 3), (0, 4), (1, 2), (1, 4), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 2), (1, 4), (3, 4))

-- Create a polynomial ring for edges
R4 = QQ[x1, x2, x3, x4, x5, x6];

-- Create a polynomial ring for vertices
S4 = QQ[t1, t2, t3, t4, t5];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t5  (edge {2,5})
-- x6 -> t3*t4  (edge {3,4})

phi4 = map(S4, R4, {t1*t2, t1*t4, t1*t5, t2*t3, t2*t5, t3*t4});

-- The toric ideal is the kernel of this map
I4 = kernel phi4;

J4 = ideal mingens I4;

-- Print results (using minimal generating set)
print("Graph 4: ");
print("  Regularity = " | toString(regularity I4));
print("  Number of generators (mingens) = " | toString(numgens J4));
print("  Degrees of generators (mingens) = " | toString(degrees J4));
print("  Minimal generators: " | toString J4);

--------------------------------------------------

-- ===== Graph 5 =====
-- Edges: [(0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 4), (2, 3)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 4), (3, 4))

-- Create a polynomial ring for edges
R5 = QQ[x1, x2, x3, x4, x5, x6, x7];

-- Create a polynomial ring for vertices
S5 = QQ[t1, t2, t3, t4, t5];

-- Map edges to vertex products:
-- x1 -> t1*t3  (edge {1,3})
-- x2 -> t1*t4  (edge {1,4})
-- x3 -> t1*t5  (edge {1,5})
-- x4 -> t2*t3  (edge {2,3})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t3*t4  (edge {3,4})

phi5 = map(S5, R5, {t1*t3, t1*t4, t1*t5, t2*t3, t2*t4, t2*t5, t3*t4});

-- The toric ideal is the kernel of this map
I5 = kernel phi5;

J5 = ideal mingens I5;

-- Print results (using minimal generating set)
print("Graph 5: ");
print("  Regularity = " | toString(regularity I5));
print("  Number of generators (mingens) = " | toString(numgens J5));
print("  Degrees of generators (mingens) = " | toString(degrees J5));
print("  Minimal generators: " | toString J5);

--------------------------------------------------

-- ===== Graph 6 =====
-- Edges: [(0, 1), (0, 2), (0, 3), (0, 4), (1, 3), (1, 4), (2, 3), (2, 4)]
-- Canonical form: ((0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (2, 4), (3, 4))

-- Create a polynomial ring for edges
R6 = QQ[x1, x2, x3, x4, x5, x6, x7, x8];

-- Create a polynomial ring for vertices
S6 = QQ[t1, t2, t3, t4, t5];

-- Map edges to vertex products:
-- x1 -> t1*t2  (edge {1,2})
-- x2 -> t1*t3  (edge {1,3})
-- x3 -> t1*t4  (edge {1,4})
-- x4 -> t1*t5  (edge {1,5})
-- x5 -> t2*t4  (edge {2,4})
-- x6 -> t2*t5  (edge {2,5})
-- x7 -> t3*t4  (edge {3,4})
-- x8 -> t3*t5  (edge {3,5})

phi6 = map(S6, R6, {t1*t2, t1*t3, t1*t4, t1*t5, t2*t4, t2*t5, t3*t4, t3*t5});

-- The toric ideal is the kernel of this map
I6 = kernel phi6;

J6 = ideal mingens I6;

-- Print results (using minimal generating set)
print("Graph 6: ");
print("  Regularity = " | toString(regularity I6));
print("  Number of generators (mingens) = " | toString(numgens J6));
print("  Degrees of generators (mingens) = " | toString(degrees J6));
print("  Minimal generators: " | toString J6);

--------------------------------------------------


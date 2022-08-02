####################################################
using Revise
using WGPU
using WGPU: pointerRef, defaultInit, partialInit

mutable struct T
	a::Int64
	b::Int32
	c::Int32
end

# t = Ref{T}()

function returnTPtr(; a=0, b=0, c=0)
	t = Ref(partialInit(T, a=a, b=b, c=c))
	tPtr = pointer_from_objref(t)
	GC.gc(true)
	return tPtr
end

tPtr = returnTPtr(a=12)

tPtrRef = unsafe_pointer_to_objref(tPtr)

tPtr2 = pointer_from_objref(tPtrRef)
tPtr2Ref = unsafe_pointer_to_objref(tPtr2)



####################################################

using Revise
using WGPU
using WGPU: pointerRef, defaultInit, partialInit

mutable struct T
	a::Int64
	b::Int32
	c::Int32
end


function returnTPtr2(; a=0, b=0, c=0)
	tPtr = pointerRef(T; a=a, b=b, c=c)
	GC.gc(true)
	return tPtr
end


####################################################

using Revise
using WGPU
using WGPU: pointerRef, defaultInit, partialInit

mutable struct TestData
	a::Int64
	b::Int32
	c::Int32
end

tPtr1 = Ref{Ptr{TestData}}()
tPtr2 = Ref{Ptr{TestData}}()
function returnTPtr1(; a=0, b=0, c=0)
	tPtr1[] = pointer_from_objref((partialInit(T; a=a, b=b, c=c)))
	GC.gc(true)
	return tPtr1[]
end


function returnTPtr2(; a=0, b=0, c=0)
	tPtr2[] = pointer(partialInit(T; a=a, b=b, c=c))
	GC.gc(true)
	return tPtr2[]
end

tPtr3 = returnTPtr1(a=12)
tPtr4 = returnTPtr2(a=12)

unsafe_load(tPtr3)
unsafe_load(tPtr4)

tPtrRef3 = unsafe_pointer_to_objref(tPtr3)



tPtr3 = returnTPtr2(a=12)

tPtrRef3 = unsafe_pointer_to_objref(tPtr3)



####################################################
using Revise
using WGPU
using WGPU: pointerRef, defaultInit, partialInit

struct TestData
	a::Int64
	b::Int32
	c::Float64
end

function returnTPtr2(; a=0, b=0, c=0)
	tPtr = pointerRef(TestData; a=a, b=b, c=c)
	# GC.gc(true)
	return tPtr
end

tPtr3 = returnTPtr2(a=12)

tPtrRef3 = unsafe_pointer_to_objref(tPtr3)


####################################################

using Revise
using WGPU
using WGPU: pointerRef, defaultInit, partialInit

struct TestData
	a::Int64
	b::Int32
	c::Float64
end

tPtr = Ref{Ptr{TestData}}()

function returnTPtr2(; a=0, b=0, c=0)
	tPtr[] = pointerRef(TestData; a=a, b=b, c=c)
	# GC.gc(true)
	return tPtr
end

tPtr3 = convert(Ref{Ptr{TestData}}, returnTPtr2(a=12))

tPtrRef3 = unsafe_pointer_to_objref(tPtr3)



####################################################

using Revise
using WGPU
using WGPU: pointerRef, defaultInit, partialInit

struct TestData
	a::Int64
	b::Int32
	c::Float64
end

tPtr1 = Ref{Ptr{TestData}}()
tPtr2 = Ref{Ptr{TestData}}()

t = Ref(partialInit(TestData; a=0, b=1, c=2))

function returnTPtr1(; a=0, b=0, c=0)
	tPtr1 = pointer_from_objref(t)
	# GC.gc(true)
	return tPtr1
end

function returnTPtr2(; a=0, b=0, c=0)
	tPtr2[] = pointerRef(t)
	return tPtr2[]
end

sptr1 = returnTPtr1(a=1, b=2, c=3)

sptr2 = returnTPtr2(a=1, b=2, c=3)

####################################################






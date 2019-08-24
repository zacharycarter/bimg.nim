when defined windows:
  when defined vcc:
    {.passC: "/std:c++14".}
    {.passC: "/fp:fast".}

    {.passC: "/D__STDC_LIMIT_MACROS".}
    {.passC: "/D__STDC_FORMAT_MACROS".}
    {.passC: "/D__STDC_CONSTANT_MACROS".}

    {.passC: "/I.\\bx\\include\\compat\\msvc".}
    {.passC: "/DWIN32".}
    {.passC: "/D_WIN32".}
    {.passC: "/D_HAS_EXCEPTIONS=0".}
    {.passC: "/D_HAS_ITERATOR_DEBUGGING=0".}
    {.passC: "/D_ITERATOR_DEBUG_LEVEL=0".}
    {.passC: "/D_SCL_SECURE=0".}
    {.passC: "/D_SECURE_SCL=0".}
    {.passC: "/D_SCL_SECURE_NO_WARNINGS".}
    {.passC: "/D_CRT_SECURE_NO_WARNINGS".}
    {.passC: "/D_CRT_SECURE_NO_DEPRECATE".}

    {.passC: "/wd4201".}
    {.passC: "/wd4324".}
    {.passC: "/Ob2".}

    {.passL: "/ignore:4221".}

    {.passC: "/IC:.\\bx\\include /I.\\bx\\3rdparty /IC:.\\bimg\\include /IC:.\\bimg\\3rdparty\\astc-codec /IC:.\\bimg\\3rdparty\\astc-codec\\include /IC:.\\bimg\\3rdparty".}

  {.compile: "bx/src/amalgamated.cpp".}
  {.compile: "bimg/src/image.cpp".}
  {.compile: "bimg/src/image_decode.cpp".}
  {.compile: "bimg/src/image_gnf.cpp".}
  
  {.compile: "bimg/3rdparty/astc-codec/src/decoder/astc_file.cc".}
  {.compile: "bimg/3rdparty/astc-codec/src/decoder/codec.cc".}
  {.compile: "bimg/3rdparty/astc-codec/src/decoder/endpoint_codec.cc".}
  {.compile: "bimg/3rdparty/astc-codec/src/decoder/footprint.cc".}
  {.compile: "bimg/3rdparty/astc-codec/src/decoder/integer_sequence_codec.cc".}
  {.compile: "bimg/3rdparty/astc-codec/src/decoder/intermediate_astc_block.cc".}
  {.compile: "bimg/3rdparty/astc-codec/src/decoder/logical_astc_block.cc".}
  {.compile: "bimg/3rdparty/astc-codec/src/decoder/partition.cc".}
  {.compile: "bimg/3rdparty/astc-codec/src/decoder/physical_astc_block.cc".}
  {.compile: "bimg/3rdparty/astc-codec/src/decoder/quantization.cc".}
  {.compile: "bimg/3rdparty/astc-codec/src/decoder/weight_infill.cc".}
  
type
  AllocatorI {.header: "<bx/allocator.h>", importcpp: "bx::AllocatorI".} = object
  DefaultAllocator {.header: "<bx/allocator.h>", importcpp: "bx::DefaultAllocator".} = object
  Error {.header: "<bx/bx.h>", importcpp: "bx::Error".} = ref object
  TextureFormatEnum {.header: "<bimg/bimg.h>", importcpp: "bimg::TextureFormat::Enum".} = enum
    R16
    Count
  ImageContainer {.header: "<bimg/bimg.h>", importcpp: "bimg::ImageContainer".} = object
    m_width: cint
    m_height: cint
    m_numMips: cint

proc imageParse(allocator: ptr AllocatorI, data: pointer, size: uint32, format: TextureFormatEnum, error: Error): ptr ImageContainer {.header: "<bimg/decode.h>", importcpp: "bimg::imageParse(@)".}

when isMainModule:
  var 
    allocator: DefaultAllocator
    ic: ptr ImageContainer

  var 
    f = open("dmap.png")
    size = getFileSize(f)
    data: seq[uint8]

newSeq(data, size)

echo readBytes(f, data, 0, size)
close(f)

ic = imageParse(cast[ptr AllocatorI](addr allocator), cast[pointer](addr data[0]), uint32(len(data)), R16, nil)
echo ic[].m_width
echo ic[].m_height
echo ic[].m_numMips
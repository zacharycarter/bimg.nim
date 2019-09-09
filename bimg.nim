import bgfxdotnim

when defined windows:
  when defined vcc:
    {.passC: "/std:c++14".}
    {.passC: "/fp:fast".}

    {.passC: "/D__STDC_LIMIT_MACROS".}
    {.passC: "/D__STDC_FORMAT_MACROS".}
    {.passC: "/D__STDC_CONSTANT_MACROS".}

    {.passC: "/Ilib\\bimgdotnim\\bx\\include\\compat\\msvc".}
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

    {.passC: "/Ilib\\bimgdotnim\\bx\\include /Ilib\\bimgdotnim\\bx\\3rdparty /Ilib\\bimgdotnim\\bimg\\include /Ilib\\bimgdotnim\\bimg\\3rdparty\\astc-codec /Ilib\\bimgdotnim\\bimg\\3rdparty\\astc-codec\\include /Ilib\\bimgdotnim\\bimg\\3rdparty".}

  {.compile: "lib/bimgdotnim/bx/src/amalgamated.cpp".}
  {.compile: "lib/bimgdotnim/bimg/src/image.cpp".}
  {.compile: "lib/bimgdotnim/bimg/src/image_decode.cpp".}
  {.compile: "lib/bimgdotnim/bimg/src/image_gnf.cpp".}
  
  {.compile: "lib/bimgdotnim/bimg/3rdparty/astc-codec/src/decoder/astc_file.cc".}
  {.compile: "lib/bimgdotnim/bimg/3rdparty/astc-codec/src/decoder/codec.cc".}
  {.compile: "lib/bimgdotnim/bimg/3rdparty/astc-codec/src/decoder/endpoint_codec.cc".}
  {.compile: "lib/bimgdotnim/bimg/3rdparty/astc-codec/src/decoder/footprint.cc".}
  {.compile: "lib/bimgdotnim/bimg/3rdparty/astc-codec/src/decoder/integer_sequence_codec.cc".}
  {.compile: "lib/bimgdotnim/bimg/3rdparty/astc-codec/src/decoder/intermediate_astc_block.cc".}
  {.compile: "lib/bimgdotnim/bimg/3rdparty/astc-codec/src/decoder/logical_astc_block.cc".}
  {.compile: "lib/bimgdotnim/bimg/3rdparty/astc-codec/src/decoder/partition.cc".}
  {.compile: "lib/bimgdotnim/bimg/3rdparty/astc-codec/src/decoder/physical_astc_block.cc".}
  {.compile: "lib/bimgdotnim/bimg/3rdparty/astc-codec/src/decoder/quantization.cc".}
  {.compile: "lib/bimgdotnim/bimg/3rdparty/astc-codec/src/decoder/weight_infill.cc".}

const STBI_DEFAULT* = 0

type
  AllocatorI {.header: "<bx/allocator.h>", importcpp: "bx::AllocatorI".} = object
  DefaultAllocator {.header: "<bx/allocator.h>", importcpp: "bx::DefaultAllocator".} = object
  Error {.header: "<bx/bx.h>", importcpp: "bx::Error".} = ref object
  Orientation* {.header: "<bimg/bimg.h>", importcpp: "bimg::Orientation::Enum".} = enum
    R0
    R90
    R180
    R270
    HFlip
    HFlipR90
    HFlipR270
    VFlip
  TextureFormat* {.header: "<bimg/bimg.h>", importcpp: "bimg::TextureFormat::Enum".} = enum
    BC1           #!< DXT1
    BC2          #!< DXT3
    BC3          #!< DXT5
    BC4          #!< LATC1/ATI1
    BC5          #!< LATC2/ATI2
    BC6H         #!< BC6H
    BC7          #!< BC7
    ETC1         #!< ETC1 RGB8
    ETC2         #!< ETC2 RGB8
    ETC2A        #!< ETC2 RGBA8
    ETC2A1       #!< ETC2 RGB8A1
    PTC12        #!< PVRTC1 RGB 2BPP
    PTC14        #!< PVRTC1 RGB 4BPP
    PTC12A       #!< PVRTC1 RGBA 2BPP
    PTC14A       #!< PVRTC1 RGBA 4BPP
    PTC22        #!< PVRTC2 RGBA 2BPP
    PTC24        #!< PVRTC2 RGBA 4BPP
    ATC          #!< ATC RGB 4BPP
    ATCE         #!< ATCE RGBA 8 BPP explicit alpha
    ATCI         #!< ATCI RGBA 8 BPP interpolated alpha
    ASTC4x4      #!< ASTC 4x4 8.0 BPP
    ASTC5x5      #!< ASTC 5x5 5.12 BPP
    ASTC6x6      #!< ASTC 6x6 3.56 BPP
    ASTC8x5      #!< ASTC 8x5 3.20 BPP
    ASTC8x6      #!< ASTC 8x6 2.67 BPP
    ASTC10x5     #!< ASTC 10x5 2.56 BPP

    Unknown      # Compressed formats above.

    R1
    A8
    R8
    R8I
    R8U
    R8S
    R16
    R16I
    R16U
    R16F
    R16S
    R32I
    R32U
    R32F
    RG8
    RG8I
    RG8U
    RG8S
    RG16
    RG16I
    RG16U
    RG16F
    RG16S
    RG32I
    RG32U
    RG32F
    RGB8
    RGB8I
    RGB8U
    RGB8S
    RGB9E5F
    BGRA8
    RGBA8
    RGBA8I
    RGBA8U
    RGBA8S
    RGBA16
    RGBA16I
    RGBA16U
    RGBA16F
    RGBA16S
    RGBA32I
    RGBA32U
    RGBA32F
    R5G6B5
    RGBA4
    RGB5A1
    RGB10A2
    RG11B10F

    UnknownDepth # Depth formats below.

    D16
    D24
    D24S8
    D32
    D16F
    D24F
    D32F
    D0S8

    Count

  ImageContainer* {.header: "<bimg/bimg.h>", importcpp: "bimg::ImageContainer".} = object
    m_data*: pointer
    m_format*: TextureFormat
    m_size*: uint32
    m_width*: uint32
    m_height*: uint32
    m_numMips*: uint8
  STBIException* = object of Exception

var allocator: DefaultAllocator

proc imageParse(allocator: ptr AllocatorI, data: pointer, size: uint32, format: TextureFormat, error: Error): ptr ImageContainer {.header: "<bimg/decode.h>", importcpp: "bimg::imageParse(@)".}

proc stbi_failure_reason(): cstring {.importc: "stbi_failure_reason".}

proc failureReason*(): string = return $stbi_failure_reason()

proc stbi_set_flip_vertically_on_load(flag_true_if_should_flip: cint) {.importc: "stbi_set_flip_vertically_on_load".}

proc setFlipVerticallyOnLoad*(flip: bool) = stbi_set_flip_vertically_on_load(if flip: 1 else: 0)

proc stbi_load(
  filename: cstring;
  x, y, channels_in_file: var cint;
  desired_channels: cint
): ptr cuchar
  {.importc: "stbi_load".}

proc stbi_image_free(retval_from_stbi_load: pointer)
  {.importc: "stbi_image_free".}


proc load*(filename: string; x, y, channels_in_file: var int; desired_channels: int): seq[byte] =
  var
    width: cint
    height: cint
    components: cint

  # Read
  let data = stbi_load(filename.cstring, width, height, components, desired_channels.cint)

  # Check for a bad read
  if data == nil:
    raise newException(STBIException, failureReason())

  # Set the returns
  x = width.int
  y = height.int
  channels_in_file = components.int

  let actual_channels = if desired_channels > 0: desired_channels else: components.int

  # Copy pixel data
  var pixelData: seq[byte]
  newSeq(pixelData, x * y * actual_channels)
  copyMem(pixelData[0].addr, data, pixelData.len)

  # Free loaded image data
  stbi_image_free(data)

  return pixelData

proc bimgLoad*(filePath: string, format: bgfx_texture_format_t): ptr ImageContainer =
  var 
    f = open(filePath)
    size = getFileSize(f)
    data: seq[uint8]
  
  newSeq(data, size)
  assert readBytes(f, data, 0, size) > 0
  close(f)
  return imageParse(cast[ptr AllocatorI](addr allocator), cast[pointer](addr data[0]), uint32(len(data)), TextureFormat(format), nil)
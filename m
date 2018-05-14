Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:19364 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932172AbeENObW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 May 2018 10:31:22 -0400
Date: Mon, 14 May 2018 22:30:21 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [kbuild:int-ll64 2/4]
 include/uapi/linux/byteorder/big_endian.h:44:52: error: unknown type name
 '__u64'
Message-ID: <201805142218.lKHKgtWv%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git int-ll64
head:   8325dcf749738c8c9d59c20a152f3ea9a7fe83b7
commit: 0b03fb786010babb910f5be220fd3bacd97f96c5 [2/4] types: move u{8,16,32,64} and s{8,16,32,64} defines to <linux/types.h>
config: sh-rsk7269_defconfig (attached as .config)
compiler: sh4-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 0b03fb786010babb910f5be220fd3bacd97f96c5
        # save the attached .config to linux build tree
        make.cross ARCH=sh 

All error/warnings (new ones prefixed by >>):

   include/uapi/linux/swab.h: In function '__swahw32p':
   include/uapi/linux/swab.h:142:25: error: '__u32' undeclared (first use in this function); did you mean 'u32'?
     (__builtin_constant_p((__u32)(x)) ? \
                            ^
   include/uapi/linux/swab.h:207:9: note: in expansion of macro '__swahw32'
     return __swahw32(*p);
            ^~~~~~~~~
   include/uapi/linux/swab.h:34:24: error: expected ')' before numeric constant
     (((__u32)(x) & (__u32)0x0000ffffUL) << 16) |  \
                           ^
   include/uapi/linux/swab.h:143:2: note: in expansion of macro '___constant_swahw32'
     ___constant_swahw32(x) :  \
     ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:207:9: note: in expansion of macro '__swahw32'
     return __swahw32(*p);
            ^~~~~~~~~
   include/uapi/linux/swab.h:35:24: error: expected ')' before numeric constant
     (((__u32)(x) & (__u32)0xffff0000UL) >> 16)))
                           ^
   include/uapi/linux/swab.h:143:2: note: in expansion of macro '___constant_swahw32'
     ___constant_swahw32(x) :  \
     ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:207:9: note: in expansion of macro '__swahw32'
     return __swahw32(*p);
            ^~~~~~~~~
   include/uapi/linux/swab.h:144:2: error: implicit declaration of function '__fswahw32'; did you mean '__swahw32'? [-Werror=implicit-function-declaration]
     __fswahw32(x))
     ^
   include/uapi/linux/swab.h:207:9: note: in expansion of macro '__swahw32'
     return __swahw32(*p);
            ^~~~~~~~~
   include/uapi/linux/swab.h: At top level:
   include/uapi/linux/swab.h:217:15: error: unknown type name '__u32'
    static inline __u32 __swahb32p(const __u32 *p)
                  ^~~~~
   include/uapi/linux/swab.h:217:38: error: unknown type name '__u32'
    static inline __u32 __swahb32p(const __u32 *p)
                                         ^~~~~
   include/uapi/linux/swab.h: In function '__swahb32p':
   include/uapi/linux/swab.h:153:25: error: '__u32' undeclared (first use in this function); did you mean 'u32'?
     (__builtin_constant_p((__u32)(x)) ? \
                            ^
   include/uapi/linux/swab.h:222:9: note: in expansion of macro '__swahb32'
     return __swahb32(*p);
            ^~~~~~~~~
   include/uapi/linux/swab.h:38:24: error: expected ')' before numeric constant
     (((__u32)(x) & (__u32)0x00ff00ffUL) << 8) |  \
                           ^
   include/uapi/linux/swab.h:154:2: note: in expansion of macro '___constant_swahb32'
     ___constant_swahb32(x) :  \
     ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:222:9: note: in expansion of macro '__swahb32'
     return __swahb32(*p);
            ^~~~~~~~~
   include/uapi/linux/swab.h:39:24: error: expected ')' before numeric constant
     (((__u32)(x) & (__u32)0xff00ff00UL) >> 8)))
                           ^
   include/uapi/linux/swab.h:154:2: note: in expansion of macro '___constant_swahb32'
     ___constant_swahb32(x) :  \
     ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:222:9: note: in expansion of macro '__swahb32'
     return __swahb32(*p);
            ^~~~~~~~~
   include/uapi/linux/swab.h:155:2: error: implicit declaration of function '__fswahb32'; did you mean '__swahb32'? [-Werror=implicit-function-declaration]
     __fswahb32(x))
     ^
   include/uapi/linux/swab.h:222:9: note: in expansion of macro '__swahb32'
     return __swahb32(*p);
            ^~~~~~~~~
   include/uapi/linux/swab.h: At top level:
   include/uapi/linux/swab.h:230:30: error: unknown type name '__u16'; did you mean 'u16'?
    static inline void __swab16s(__u16 *p)
                                 ^~~~~
                                 u16
   include/uapi/linux/swab.h:242:39: error: unknown type name '__u32'; did you mean 'u32'?
    static __always_inline void __swab32s(__u32 *p)
                                          ^~~~~
                                          u32
   include/uapi/linux/swab.h:255:39: error: unknown type name '__u64'; did you mean 'u64'?
    static __always_inline void __swab64s(__u64 *p)
                                          ^~~~~
                                          u64
   include/uapi/linux/swab.h:270:31: error: unknown type name '__u32'; did you mean 'u32'?
    static inline void __swahw32s(__u32 *p)
                                  ^~~~~
                                  u32
   include/uapi/linux/swab.h:285:31: error: unknown type name '__u32'; did you mean 'u32'?
    static inline void __swahb32s(__u32 *p)
                                  ^~~~~
                                  u32
   In file included from include/linux/byteorder/big_endian.h:5:0,
                    from arch/sh/include/uapi/asm/byteorder.h:8,
                    from arch/sh/include/asm/bitops.h:12,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:18,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
>> include/uapi/linux/byteorder/big_endian.h:44:52: error: unknown type name '__u64'
    static __always_inline __le64 __cpu_to_le64p(const __u64 *p)
                                                       ^~~~~
   include/uapi/linux/byteorder/big_endian.h:48:24: error: unknown type name '__u64'
    static __always_inline __u64 __le64_to_cpup(const __le64 *p)
                           ^~~~~
   include/uapi/linux/byteorder/big_endian.h: In function '__le64_to_cpup':
>> include/uapi/linux/byteorder/big_endian.h:50:20: error: '__u64' undeclared (first use in this function); did you mean 'u64'?
     return __swab64p((__u64 *)p);
                       ^~~~~
                       u64
>> include/uapi/linux/byteorder/big_endian.h:50:27: error: expected expression before ')' token
     return __swab64p((__u64 *)p);
                              ^
   include/uapi/linux/byteorder/big_endian.h: At top level:
>> include/uapi/linux/byteorder/big_endian.h:52:52: error: unknown type name '__u32'
    static __always_inline __le32 __cpu_to_le32p(const __u32 *p)
                                                       ^~~~~
   include/uapi/linux/byteorder/big_endian.h:56:24: error: unknown type name '__u32'
    static __always_inline __u32 __le32_to_cpup(const __le32 *p)
                           ^~~~~
   include/uapi/linux/byteorder/big_endian.h: In function '__le32_to_cpup':
>> include/uapi/linux/byteorder/big_endian.h:58:20: error: '__u32' undeclared (first use in this function); did you mean 'u32'?
     return __swab32p((__u32 *)p);
                       ^~~~~
                       u32
   include/uapi/linux/byteorder/big_endian.h:58:27: error: expected expression before ')' token
     return __swab32p((__u32 *)p);
                              ^
   include/uapi/linux/byteorder/big_endian.h: At top level:
>> include/uapi/linux/byteorder/big_endian.h:60:52: error: unknown type name '__u16'
    static __always_inline __le16 __cpu_to_le16p(const __u16 *p)
                                                       ^~~~~
   include/uapi/linux/byteorder/big_endian.h:64:24: error: unknown type name '__u16'
    static __always_inline __u16 __le16_to_cpup(const __le16 *p)
                           ^~~~~
   include/uapi/linux/byteorder/big_endian.h: In function '__le16_to_cpup':
>> include/uapi/linux/byteorder/big_endian.h:66:20: error: '__u16' undeclared (first use in this function); did you mean 'u16'?
     return __swab16p((__u16 *)p);
                       ^~~~~
                       u16
   include/uapi/linux/byteorder/big_endian.h:66:27: error: expected expression before ')' token
     return __swab16p((__u16 *)p);
                              ^
   include/uapi/linux/byteorder/big_endian.h: At top level:
   include/uapi/linux/byteorder/big_endian.h:68:52: error: unknown type name '__u64'
    static __always_inline __be64 __cpu_to_be64p(const __u64 *p)
                                                       ^~~~~
   include/uapi/linux/byteorder/big_endian.h:72:24: error: unknown type name '__u64'
    static __always_inline __u64 __be64_to_cpup(const __be64 *p)
                           ^~~~~
   include/uapi/linux/byteorder/big_endian.h: In function '__be64_to_cpup':
   include/uapi/linux/byteorder/big_endian.h:74:18: error: '__u64' undeclared (first use in this function); did you mean 'u64'?
     return (__force __u64)*p;
                     ^~~~~
                     u64
   include/uapi/linux/byteorder/big_endian.h: At top level:
   include/uapi/linux/byteorder/big_endian.h:76:52: error: unknown type name '__u32'
    static __always_inline __be32 __cpu_to_be32p(const __u32 *p)
                                                       ^~~~~
   include/uapi/linux/byteorder/big_endian.h:80:24: error: unknown type name '__u32'
    static __always_inline __u32 __be32_to_cpup(const __be32 *p)
                           ^~~~~
   include/uapi/linux/byteorder/big_endian.h: In function '__be32_to_cpup':
   include/uapi/linux/byteorder/big_endian.h:82:18: error: '__u32' undeclared (first use in this function); did you mean 'u32'?
     return (__force __u32)*p;
                     ^~~~~
                     u32
   include/uapi/linux/byteorder/big_endian.h: At top level:
   include/uapi/linux/byteorder/big_endian.h:84:52: error: unknown type name '__u16'
    static __always_inline __be16 __cpu_to_be16p(const __u16 *p)
                                                       ^~~~~
   include/uapi/linux/byteorder/big_endian.h:88:24: error: unknown type name '__u16'
    static __always_inline __u16 __be16_to_cpup(const __be16 *p)
                           ^~~~~
   include/uapi/linux/byteorder/big_endian.h: In function '__be16_to_cpup':
   include/uapi/linux/byteorder/big_endian.h:90:18: error: '__u16' undeclared (first use in this function); did you mean 'u16'?
     return (__force __u16)*p;
                     ^~~~~
                     u16
   In file included from include/linux/swab.h:5:0,
                    from include/uapi/linux/byteorder/big_endian.h:13,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/sh/include/uapi/asm/byteorder.h:8,
                    from arch/sh/include/asm/bitops.h:12,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:18,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   include/linux/byteorder/generic.h: In function 'le16_add_cpu':
   include/uapi/linux/swab.h:104:25: error: '__u16' undeclared (first use in this function); did you mean 'u16'?
     (__builtin_constant_p((__u16)(x)) ? \
                            ^
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:9: note: in expansion of macro 'cpu_to_le16'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
            ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:104:32: note: in definition of macro '__swab16'
     (__builtin_constant_p((__u16)(x)) ? \
                                   ^
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:104:32: note: in definition of macro '__swab16'
     (__builtin_constant_p((__u16)(x)) ? \
                                   ^
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
   include/uapi/linux/swab.h:14:24: error: expected ')' before numeric constant
     (((__u16)(x) & (__u16)0x00ffU) << 8) |   \
                           ^
   include/uapi/linux/swab.h:104:32: note: in definition of macro '__swab16'
     (__builtin_constant_p((__u16)(x)) ? \
                                   ^
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:104:32: note: in definition of macro '__swab16'
     (__builtin_constant_p((__u16)(x)) ? \
                                   ^
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
   include/uapi/linux/swab.h:15:24: error: expected ')' before numeric constant
     (((__u16)(x) & (__u16)0xff00U) >> 8)))
                           ^
   include/uapi/linux/swab.h:104:32: note: in definition of macro '__swab16'
     (__builtin_constant_p((__u16)(x)) ? \
                                   ^
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:104:32: note: in definition of macro '__swab16'
     (__builtin_constant_p((__u16)(x)) ? \
                                   ^
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:14:12: note: in definition of macro '___constant_swab16'
     (((__u16)(x) & (__u16)0x00ffU) << 8) |   \
               ^
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:14:12: note: in definition of macro '___constant_swab16'
     (((__u16)(x) & (__u16)0x00ffU) << 8) |   \
               ^
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
   include/uapi/linux/swab.h:14:24: error: expected ')' before numeric constant
     (((__u16)(x) & (__u16)0x00ffU) << 8) |   \
                           ^
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:14:12: note: in definition of macro '___constant_swab16'
     (((__u16)(x) & (__u16)0x00ffU) << 8) |   \
               ^
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
   include/uapi/linux/swab.h:15:24: error: expected ')' before numeric constant
     (((__u16)(x) & (__u16)0xff00U) >> 8)))
                           ^
   include/uapi/linux/swab.h:14:12: note: in definition of macro '___constant_swab16'
     (((__u16)(x) & (__u16)0x00ffU) << 8) |   \
               ^
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:14:12: note: in definition of macro '___constant_swab16'
     (((__u16)(x) & (__u16)0x00ffU) << 8) |   \
               ^
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
   include/uapi/linux/swab.h:14:24: error: expected ')' before numeric constant
     (((__u16)(x) & (__u16)0x00ffU) << 8) |   \
                           ^
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:9: note: in expansion of macro 'cpu_to_le16'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
            ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:15:12: note: in definition of macro '___constant_swab16'
     (((__u16)(x) & (__u16)0xff00U) >> 8)))
               ^
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:15:12: note: in definition of macro '___constant_swab16'
     (((__u16)(x) & (__u16)0xff00U) >> 8)))
               ^
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
   include/uapi/linux/swab.h:14:24: error: expected ')' before numeric constant
     (((__u16)(x) & (__u16)0x00ffU) << 8) |   \
                           ^
   include/uapi/linux/swab.h:15:12: note: in definition of macro '___constant_swab16'
     (((__u16)(x) & (__u16)0xff00U) >> 8)))
               ^
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:15:12: note: in definition of macro '___constant_swab16'
     (((__u16)(x) & (__u16)0xff00U) >> 8)))
               ^
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
   include/uapi/linux/swab.h:15:24: error: expected ')' before numeric constant
     (((__u16)(x) & (__u16)0xff00U) >> 8)))
                           ^
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:15:12: note: in definition of macro '___constant_swab16'
     (((__u16)(x) & (__u16)0xff00U) >> 8)))
               ^
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~
   include/uapi/linux/swab.h:15:24: error: expected ')' before numeric constant
     (((__u16)(x) & (__u16)0xff00U) >> 8)))
                           ^
   include/uapi/linux/swab.h:105:2: note: in expansion of macro '___constant_swab16'
     ___constant_swab16(x) :   \
     ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:43: note: in expansion of macro '__swab16'
    #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                                              ^~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:9: note: in expansion of macro 'cpu_to_le16'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
            ^~~~~~~~~~~
>> include/uapi/linux/byteorder/big_endian.h:36:51: error: expected expression before '__le16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                      ^
   include/uapi/linux/swab.h:106:12: note: in definition of macro '__swab16'
     __fswab16(x))
               ^
   include/linux/byteorder/generic.h:90:21: note: in expansion of macro '__cpu_to_le16'
    #define cpu_to_le16 __cpu_to_le16
                        ^~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:36:26: note: in expansion of macro '__swab16'
    #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                             ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
    #define le16_to_cpu __le16_to_cpu
                        ^~~~~~~~~~~~~
   include/linux/byteorder/generic.h:146:21: note: in expansion of macro 'le16_to_cpu'
     *var = cpu_to_le16(le16_to_cpu(*var) + val);
                        ^~~~~~~~~~~

vim +/__u64 +44 include/uapi/linux/byteorder/big_endian.h

5921e6f8 David Howells  2012-10-13   14  
5921e6f8 David Howells  2012-10-13   15  #define __constant_htonl(x) ((__force __be32)(__u32)(x))
5921e6f8 David Howells  2012-10-13   16  #define __constant_ntohl(x) ((__force __u32)(__be32)(x))
5921e6f8 David Howells  2012-10-13   17  #define __constant_htons(x) ((__force __be16)(__u16)(x))
5921e6f8 David Howells  2012-10-13   18  #define __constant_ntohs(x) ((__force __u16)(__be16)(x))
5921e6f8 David Howells  2012-10-13   19  #define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
5921e6f8 David Howells  2012-10-13   20  #define __constant_le64_to_cpu(x) ___constant_swab64((__force __u64)(__le64)(x))
5921e6f8 David Howells  2012-10-13   21  #define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
5921e6f8 David Howells  2012-10-13   22  #define __constant_le32_to_cpu(x) ___constant_swab32((__force __u32)(__le32)(x))
5921e6f8 David Howells  2012-10-13   23  #define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
5921e6f8 David Howells  2012-10-13   24  #define __constant_le16_to_cpu(x) ___constant_swab16((__force __u16)(__le16)(x))
5921e6f8 David Howells  2012-10-13   25  #define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8 David Howells  2012-10-13   26  #define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8 David Howells  2012-10-13   27  #define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8 David Howells  2012-10-13   28  #define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8 David Howells  2012-10-13   29  #define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8 David Howells  2012-10-13   30  #define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8 David Howells  2012-10-13  @31  #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
5921e6f8 David Howells  2012-10-13  @32  #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
5921e6f8 David Howells  2012-10-13  @33  #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
5921e6f8 David Howells  2012-10-13  @34  #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
5921e6f8 David Howells  2012-10-13  @35  #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
5921e6f8 David Howells  2012-10-13  @36  #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
5921e6f8 David Howells  2012-10-13  @37  #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8 David Howells  2012-10-13  @38  #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8 David Howells  2012-10-13  @39  #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8 David Howells  2012-10-13  @40  #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8 David Howells  2012-10-13  @41  #define __cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8 David Howells  2012-10-13  @42  #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8 David Howells  2012-10-13   43  
bc27fb68 Denys Vlasenko 2016-03-17  @44  static __always_inline __le64 __cpu_to_le64p(const __u64 *p)
5921e6f8 David Howells  2012-10-13   45  {
5921e6f8 David Howells  2012-10-13   46  	return (__force __le64)__swab64p(p);
5921e6f8 David Howells  2012-10-13   47  }
bc27fb68 Denys Vlasenko 2016-03-17  @48  static __always_inline __u64 __le64_to_cpup(const __le64 *p)
5921e6f8 David Howells  2012-10-13   49  {
5921e6f8 David Howells  2012-10-13  @50  	return __swab64p((__u64 *)p);
5921e6f8 David Howells  2012-10-13   51  }
bc27fb68 Denys Vlasenko 2016-03-17  @52  static __always_inline __le32 __cpu_to_le32p(const __u32 *p)
5921e6f8 David Howells  2012-10-13   53  {
5921e6f8 David Howells  2012-10-13   54  	return (__force __le32)__swab32p(p);
5921e6f8 David Howells  2012-10-13   55  }
bc27fb68 Denys Vlasenko 2016-03-17   56  static __always_inline __u32 __le32_to_cpup(const __le32 *p)
5921e6f8 David Howells  2012-10-13   57  {
5921e6f8 David Howells  2012-10-13  @58  	return __swab32p((__u32 *)p);
5921e6f8 David Howells  2012-10-13   59  }
bc27fb68 Denys Vlasenko 2016-03-17  @60  static __always_inline __le16 __cpu_to_le16p(const __u16 *p)
5921e6f8 David Howells  2012-10-13   61  {
5921e6f8 David Howells  2012-10-13   62  	return (__force __le16)__swab16p(p);
5921e6f8 David Howells  2012-10-13   63  }
bc27fb68 Denys Vlasenko 2016-03-17   64  static __always_inline __u16 __le16_to_cpup(const __le16 *p)
5921e6f8 David Howells  2012-10-13   65  {
5921e6f8 David Howells  2012-10-13  @66  	return __swab16p((__u16 *)p);
5921e6f8 David Howells  2012-10-13   67  }
bc27fb68 Denys Vlasenko 2016-03-17   68  static __always_inline __be64 __cpu_to_be64p(const __u64 *p)
5921e6f8 David Howells  2012-10-13   69  {
5921e6f8 David Howells  2012-10-13   70  	return (__force __be64)*p;
5921e6f8 David Howells  2012-10-13   71  }
bc27fb68 Denys Vlasenko 2016-03-17   72  static __always_inline __u64 __be64_to_cpup(const __be64 *p)
5921e6f8 David Howells  2012-10-13   73  {
5921e6f8 David Howells  2012-10-13   74  	return (__force __u64)*p;
5921e6f8 David Howells  2012-10-13   75  }
bc27fb68 Denys Vlasenko 2016-03-17   76  static __always_inline __be32 __cpu_to_be32p(const __u32 *p)
5921e6f8 David Howells  2012-10-13   77  {
5921e6f8 David Howells  2012-10-13   78  	return (__force __be32)*p;
5921e6f8 David Howells  2012-10-13   79  }
bc27fb68 Denys Vlasenko 2016-03-17   80  static __always_inline __u32 __be32_to_cpup(const __be32 *p)
5921e6f8 David Howells  2012-10-13   81  {
5921e6f8 David Howells  2012-10-13   82  	return (__force __u32)*p;
5921e6f8 David Howells  2012-10-13   83  }
bc27fb68 Denys Vlasenko 2016-03-17   84  static __always_inline __be16 __cpu_to_be16p(const __u16 *p)
5921e6f8 David Howells  2012-10-13   85  {
5921e6f8 David Howells  2012-10-13   86  	return (__force __be16)*p;
5921e6f8 David Howells  2012-10-13   87  }
bc27fb68 Denys Vlasenko 2016-03-17   88  static __always_inline __u16 __be16_to_cpup(const __be16 *p)
5921e6f8 David Howells  2012-10-13   89  {
5921e6f8 David Howells  2012-10-13   90  	return (__force __u16)*p;
5921e6f8 David Howells  2012-10-13   91  }
5921e6f8 David Howells  2012-10-13   92  #define __cpu_to_le64s(x) __swab64s((x))
5921e6f8 David Howells  2012-10-13   93  #define __le64_to_cpus(x) __swab64s((x))
5921e6f8 David Howells  2012-10-13   94  #define __cpu_to_le32s(x) __swab32s((x))
5921e6f8 David Howells  2012-10-13  @95  #define __le32_to_cpus(x) __swab32s((x))
5921e6f8 David Howells  2012-10-13   96  #define __cpu_to_le16s(x) __swab16s((x))
5921e6f8 David Howells  2012-10-13   97  #define __le16_to_cpus(x) __swab16s((x))
5921e6f8 David Howells  2012-10-13   98  #define __cpu_to_be64s(x) do { (void)(x); } while (0)
5921e6f8 David Howells  2012-10-13   99  #define __be64_to_cpus(x) do { (void)(x); } while (0)
5921e6f8 David Howells  2012-10-13  100  #define __cpu_to_be32s(x) do { (void)(x); } while (0)
5921e6f8 David Howells  2012-10-13  101  #define __be32_to_cpus(x) do { (void)(x); } while (0)
5921e6f8 David Howells  2012-10-13  102  #define __cpu_to_be16s(x) do { (void)(x); } while (0)
5921e6f8 David Howells  2012-10-13  103  #define __be16_to_cpus(x) do { (void)(x); } while (0)
5921e6f8 David Howells  2012-10-13  104  
5921e6f8 David Howells  2012-10-13  105  

:::::: The code at line 44 was first introduced by commit
:::::: bc27fb68aaad44dd8f5c34924f05721f0abaeec1 include/uapi/linux/byteorder, swab: force inlining of some byteswap operations

:::::: TO: Denys Vlasenko <dvlasenk@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--Kj7319i9nmIyA2yE
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
/c5sraUAAA==

--Kj7319i9nmIyA2yE--

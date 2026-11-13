Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604175;
	b=RejOMebbK6+C0Cfx4CvVGYXun0TR3wN25bDOR0zt8MsWKTHfCB46MFA9Hz9OcFryHC7n
	 sAYjzG7or2vZHAjBSwgoyKXwjHarOEbX9EPMqYhZgYsPxOEG6RnF+xT2SEuhQxyzw328J
	 4lB+PPnLXckPqUVsw7wRxt1WqRIgCTL7Iq4LIncq0Vec3zQPHGsGDE/yBJC60Os2XPF6s
	 BDnbW5dmS1YD/xwbhXCYLsJTdGM1LaZZEbUrOAjfikT3B3nvi1206KQu+foH0zFuIbebJ
	 oBsnIaud/YiilQ8oX3W3QkxxDHjwZ5nPvE7v/eFU4yoWNcebMXhI33f6IBFldPm6IFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cqq5NJAb+arvmaQbk3zWtpJH7+lBUUppmIfhzqVt9Js=;
	b=IiP6VU26g3pvlrjFAYCQBqUkVw8BDC/cmAUZ5YalCY3DagwVS+IF0JJeZmLdHKk9iUE6
	 cd7CRFXWMffpli2zw07RkKlDRWWOv+7rXKX06PoQNsLmCeCfCXqlsoczRh6/N4B/mBjVx
	 z6/htjqYXeFIVdNFLwChkyhIksQhnWB4WYyNffgRfRWJ+35TXofeh3u0NwxwidHd+g8N9
	 IsJWSQJFPfEKg0TNvSg3mR4B155SJ1sTKLzAOFVv9HpLtkxcj9KiE+iDaRnhjyR1ibB8e
	 sgeKQGdvKHwUDJJwiqxXRIyQbaPgCur8PbR2FP5LnUit1xsxhp5kuRnpsH9/KpDCNbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TXCm7U1P;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1199760A2625
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 21:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1199760A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TXCm7U1P
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1035477c88.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 13:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604174; x=1795208974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cqq5NJAb+arvmaQbk3zWtpJH7+lBUUppmIfhzqVt9Js=;
        b=TXCm7U1P29vfD7TyytvpDfPET+4rVImhV7n9TjABJrXxHFhjbS2S6+5YOBY/vHQEn3
         sqyzy62pE1RwHL+F3zPb7w8G9Utysh0ieuoOSfwfrMNxZBWEK6M0FZV6K5pN7Pl0Hu/D
         FTxRVGx/LpVYluG/XKdlVrlVuNoRvNIXL1lG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604174; x=1795208974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cqq5NJAb+arvmaQbk3zWtpJH7+lBUUppmIfhzqVt9Js=;
        b=Xw8XJ5gdl0dfAD0EfQDQ7IGnqi5wAg9bnJftaP6VQ4Nnv+hKNEF8Kgda+6HfafOJ1+
         CRMOGJzOqT4p/6nfv17GkWGHXopr+ViHWmieNhnj2xu0i+xMMaxP+Y089OrQMsWffu3U
         eQc8Ic7j6c9lpwqTy40gcjAW5ykFr0LEHZJSO3nuQN5nBrhFN+GqPNieX8zp43hljQY1
         +BvwmQuNQ9MRGk/NNS40K/C1ITLVQxwGqyK4gBYIVEtpxx+wDbX8OICqDUFIPqxRI1Rv
         nK2jIg7aetRrq9yZvmqgA2RwwU+6xLRZ23R83LOg44YesMQlixvnhccCBuihpDk/pcj5
         2djw==
X-Forwarded-Encrypted: i=1; AL+hErEJ/Al0UFCaNfdrihQSx386nZXEwQVmRhTH7zNBCd2X4J7Rpn6fo+aa5kh8VpsbQAx6BWiZ80qqVshV13Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e/v8/KqIOCwUvB30nvt/y5jvHnQVIjgkW9rVS9yo4d34QZv6t
	2izwOdWYbgbMyXYmio8AUduBHiReOtNdBCMQNUn2J5cz8f7RKib528lzoNR9n89yzg==
X-Gm-Gg: AYBFou0cwzVnN4HdtTGRraZfzaungGslsOJbQfYPdgvJQmYT98cdC4fwIqodVAVNutN
	8JJ9z5PiGanoDk/0P9849AqqlGz3lShggG0BsCC4bThMh2OJrd1fenzI37lpi+zEAYZhwceJJhO
	gjjxM+NobGbdP0AXMN3qhQ68hbHP9LLeEGlig+pB9ttYBJachw5+i0cxNs6ZN4u9bMXl3iCYcAT
	cLP0r5Tn3JH53Sf3E+LC1Q1wH32M07mnKFr7P0sGOkBTsE+veW7oQLiFmJO4GLyzCyV/HSpyma9
	YhsrbgVjI+9eUOCzjz/sWn9IqoU8DwxzMAJlNpBcRJJMiTbNAa5bx5F73o4KVhyUDgnJhz7EljQ
	Z1x2wqXXxP1KaCWSeMU9fexX8vFz1kY9phbpUqjJwZL3aC2QutQAdcUGl9Xfmh+JGobHDawaoXk
	t3E2QPmluJA4QE1OBDDaogrUekpjgtSbL3o8Wjgu65PjEeZ/wWc5Fbl2Is4WYv9Vh/KjOUq54mz
	LHV4ZEt9/tOLAbgJApzgknMrMTO2nleKrziCEsAbnRKLcMjGYJBDf2mQcfzB9dcE4x5U8MjUx6I
	b2IynDbXCuLUFHD5HKHgsgHS7+NQxdWgFrFXtwBvCMrtkCXHKbmixralgd1fSu/ah0kiRczoDO4
	9FODkxpBc3iJN
X-Received: by 2002:a05:701b:2050:10b0:1b3:b322:a42c with SMTP id a92af1059eb24-1b503099b0dmr3363384c88.13.1794604173943;
        Fri, 13 Nov 2026 13:09:33 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:32 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Marco Elver <elver@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rong Xu <xur@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 2/5] kbuild: fit: Support selecting DTBs and config properties from a file
Date: Fri, 13 Nov 2026 13:09:11 -0800
Message-ID: <20261113130858.RFC.v2.2.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow passing `FIT_CONFIG=<path>` on the make command line (relative to
either `$(srctree)` or `arch/$(SRCARCH)/boot/dts/`) when building
`image.fit` to select which DTBs are built and included in the FIT image
and to optionally set properties or subnodes on each
`/configurations/conf-N` node.

The `.fitconfig` file uses standard INI syntax parsed by Python's
`configparser` module:
- `#` starts a comment.
- Each `[<dtb-name>.dtb]` section header specifies a `.dtb` filename
  (relative to the directory containing the `.fitconfig` file), starting
  a new FIT configuration entry.
- Optional `<prop> = <value>` lines inside a section set or override
  properties on that `/configurations/conf-N` node, or on a child
  subnode when `<subnode>/<prop> = <value>` is used (for example, adding
  a `match-1` subnode with board/SoC matching properties per [1]).
  Unquoted integer literals (such as `0x070406` or `123`) are written as
  32-bit integer cells; all other values (including values enclosed in
  double quotes) are written as strings. Any configuration that does not
  override `description` or `compatible` continues to inherit `/model`
  and `/compatible` from the DTB.

When `FIT_CONFIG` is specified, `scripts/Makefile.lib` invokes
`scripts/make_fit.py --list-dtbs` to obtain the list of DTBs to build,
`scripts/Makefile.dtbs` restricts `$(dtb-y)` (including `make dtbs` and
`make dtbs_install`) to those DTBs, and `cmd_fit` passes `--config
$(FIT_CONFIG_FILE)` to `scripts/make_fit.py`.

The main motivation for this is to allow associating per-board matching
metadata with each configuration [1] and restricting the FIT image to a
specific family of boards without needing a hand-written `.its` file or
`mkimage`.

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Replace FIT_ITS + mkimage + fdtget/fdtput approach with FIT_CONFIG
  .fitconfig sidecar files handled directly by scripts/make_fit.py
  (Simon Glass)
- Support subnode properties (e.g. match-1/...) and u32 integer values
  for the proposed FIT configuration match subnode spec (Simon Glass)
- Document FIT_CONFIG in Documentation/kbuild/kbuild.rst and under
  image.fit in arm64 'make help' (Simon Glass)

 Documentation/kbuild/kbuild.rst |   7 ++
 arch/arm64/Makefile             |   3 +-
 scripts/Makefile.dtbs           |   9 +++
 scripts/Makefile.lib            |  25 +++++++
 scripts/make_fit.py             | 117 ++++++++++++++++++++++++++++----
 5 files changed, 146 insertions(+), 15 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 744a32ccbd1c..80cac4c432e4 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -376,3 +376,10 @@ FIT_DECOMPOSE_DTBS
 If set to a non-empty value when building ``image.fit``, decompose composite
 DTBs (built from a base ``.dtb`` plus ``.dtbo`` overlays) into their component
 blobs and deduplicate them in the FIT.
+
+FIT_CONFIG
+----------
+Path to a ``.fitconfig`` configuration file (relative to ``$(srctree)`` or
+``arch/$(SRCARCH)/boot/dts/``) selecting which DTBs to build and include in
+``image.fit`` and optionally setting properties or subnodes on each
+``/configurations/conf-N`` node.
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 8818d6a2015b..b4982e94f80a 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -223,7 +223,8 @@ define archhelp
   echo  '* Image.gz      - Compressed kernel image (arch/$(ARCH)/boot/Image.gz)'
   echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
   echo  '  image.fit     - Flat Image Tree (arch/$(ARCH)/boot/image.fit)'
-  echo  '                  Configured by FIT_COMPRESSION and FIT_DECOMPOSE_DTBS'
+  echo  '                  Configured by FIT_COMPRESSION, FIT_DECOMPOSE_DTBS,'
+  echo  '                  and FIT_CONFIG'
   echo  '  install       - Install kernel (compressed if COMPRESSED_INSTALL set)'
   echo  '  zinstall      - Install compressed kernel'
   echo  '                  Install using (your) ~/bin/installkernel or'
diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index c4e466390284..cc14fc905ea3 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -5,6 +5,15 @@ all-dtb := $(dtb-y) $(dtb-)
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
 dtb-$(CONFIG_OF_ALL_DTBS) += $(dtb-)
 
+# If FIT_CONFIG is specified, restrict $(dtb-y) to only the DTBs listed in
+# $(FIT_CONFIG_FILE).
+ifdef FIT_CONFIG_FILE
+ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
+dtb-y := $(filter $(all-dtb), \
+	$(patsubst $(obj)/%, %, $(filter $(obj)/%, $(FIT_CONFIG_DTBS))))
+endif
+endif
+
 # Composite DTB (i.e. DTB constructed by overlay)
 multi-dtb-y := $(call multi-search, $(dtb-y), .dtb, -dtbs)
 # Primitive DTB compiled from *.dts
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 19e96b30a122..e08e35d4ed74 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -427,8 +427,33 @@ quiet_cmd_fit = FIT     $@
 		--name '$(UIMAGE_NAME)' $(FIT_EXTRA_ARGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
+		$(if $(FIT_CONFIG_FILE),--config $(FIT_CONFIG_FILE)) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
 
+# If FIT_CONFIG is specified on the command line (either relative to $(srctree)
+# or relative to arch/$(SRCARCH)/boot/dts/), locate that file and extract the
+# list of .dtb files to build.
+ifdef FIT_CONFIG
+FIT_CONFIG_REL := $(firstword $(patsubst $(abs_srctree)/%,%,\
+	$(patsubst $(srctree)/%,%,$(patsubst ./%,%,$(wildcard \
+	$(FIT_CONFIG) \
+	$(srctree)/$(FIT_CONFIG) \
+	$(srctree)/arch/$(SRCARCH)/boot/dts/$(FIT_CONFIG))))))
+ifeq ($(FIT_CONFIG_REL),)
+$(error FIT_CONFIG '$(FIT_CONFIG)' not found)
+endif
+FIT_CONFIG_FILE := $(srctree)/$(FIT_CONFIG_REL)
+ifndef FIT_CONFIG_DTBS
+export FIT_CONFIG_DTBS := $(addprefix $(dir $(FIT_CONFIG_REL)), \
+	$(shell $(MAKE_FIT) -C $(FIT_CONFIG_FILE) --list-dtbs))
+$(if $(FIT_CONFIG_DTBS),,$(error Failed to parse DTB list from $(FIT_CONFIG_FILE)))
+endif
+
+ifneq ($(filter image.fit,$(targets)),)
+$(obj)/image.fit: $(FIT_CONFIG_FILE)
+endif
+endif
+
 # XZ
 # ---------------------------------------------------------------------------
 # Use xzkern or xzkern_with_size to compress the kernel image and xzmisc to
diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 9bd35aa72119..0c0af8042641 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -26,6 +26,10 @@ the entire FIT.
 Use -c to compress the data, using bzip2, gzip, lz4, lzma, lzo and
 zstd algorithms.
 
+Use -C to specify a FIT configuration file (.fitconfig) that selects
+which DTBs to include and optionally sets properties or subnodes (such
+as 'match-1') on the generated /configurations/conf-N nodes.
+
 Use -D to decompose "composite" DTBs into their base components and
 deduplicate the resulting base DTBs and DTB overlays. This requires the
 DTBs to be sourced from the kernel build directory, as the implementation
@@ -37,6 +41,7 @@ as U-Boot, Linuxboot, Tianocore, etc.
 
 import argparse
 import collections
+import configparser
 import multiprocessing
 import os
 import subprocess
@@ -69,21 +74,25 @@ def parse_args():
     """
     epilog = 'Build a FIT from a directory tree containing .dtb files'
     parser = argparse.ArgumentParser(epilog=epilog, fromfile_prefix_chars='@')
-    parser.add_argument('-A', '--arch', type=str, required=True,
+    parser.add_argument('-A', '--arch', type=str,
           help='Specifies the architecture')
     parser.add_argument('-c', '--compress', type=str, default='none',
           help='Specifies the compression')
+    parser.add_argument('-C', '--config', type=str,
+          help='Specifies a FIT configuration file (.fitconfig)')
     parser.add_argument('-D', '--decompose-dtbs', action='store_true',
           help='Decompose composite DTBs into base DTB and overlays')
     parser.add_argument('-E', '--external', action='store_true',
           help='Convert the FIT to use external data')
-    parser.add_argument('-n', '--name', type=str, required=True,
+    parser.add_argument('-l', '--list-dtbs', action='store_true',
+          help='List the DTB filenames from the configuration file and exit')
+    parser.add_argument('-n', '--name', type=str,
           help='Specifies the name')
-    parser.add_argument('-o', '--output', type=str, required=True,
+    parser.add_argument('-o', '--output', type=str,
           help='Specifies the output file (.fit)')
-    parser.add_argument('-O', '--os', type=str, required=True,
+    parser.add_argument('-O', '--os', type=str,
           help='Specifies the operating system')
-    parser.add_argument('-k', '--kernel', type=str, required=True,
+    parser.add_argument('-k', '--kernel', type=str,
           help='Specifies the (uncompressed) kernel input file (.itk)')
     parser.add_argument('-r', '--ramdisk', type=str,
           help='Specifies the ramdisk/initrd input file')
@@ -92,7 +101,15 @@ def parse_args():
     parser.add_argument('dtbs', type=str, nargs='*',
           help='Specifies the devicetree files to process')
 
-    return parser.parse_args()
+    args = parser.parse_args()
+    if args.list_dtbs:
+        if not args.config:
+            parser.error('--list-dtbs requires -C/--config')
+    else:
+        for opt in ('arch', 'name', 'output', 'os', 'kernel'):
+            if not getattr(args, opt):
+                parser.error(f'--{opt} is required')
+    return args
 
 
 def setup_fit(fsw, name):
@@ -160,6 +177,49 @@ def write_ramdisk(fsw, data, args):
         fsw.property('data', data)
 
 
+def parse_config(fname):
+    """Parse a FIT configuration (.fitconfig) file
+
+    Each [section] header names a .dtb file (relative to the directory
+    containing the configuration file) and starts a FIT configuration entry.
+    Optional 'key = value' lines in the section set or override properties
+    on that /configurations/conf-N node (or on a subnode when 'key' has the
+    form 'subnode/prop', such as 'match-1/board-id = 0x070406').
+
+    Args:
+        fname (str): Path to the .fitconfig file
+
+    Returns:
+        dict: Mapping of DTB filename (str) to property overrides (dict)
+    """
+    cfg = configparser.ConfigParser(interpolation=None)
+    cfg.optionxform = str
+    with open(fname, 'r', encoding='utf-8') as inf:
+        cfg.read_file(inf, source=fname)
+    return {sec: dict(cfg.items(sec)) for sec in cfg.sections()}
+
+
+def write_prop(fsw, name, val):
+    """Write a configuration property as a u32 or string
+
+    Unquoted integer literals (such as '0x070406' or '123') are written
+    as 32-bit integer cells; all other values (including values enclosed
+    in double quotes) are written as strings.
+
+    Args:
+        fsw (libfdt.FdtSw): Object to use for writing
+        name (str): Property name
+        val (str): Raw property value string from the configuration file
+    """
+    if len(val) >= 2 and val.startswith('"') and val.endswith('"'):
+        fsw.property_string(name, val[1:-1])
+        return
+    try:
+        fsw.property_u32(name, int(val, 0))
+    except ValueError:
+        fsw.property_string(name, val)
+
+
 def finish_fit(fsw, entries, has_ramdisk=False):
     """Finish the FIT ready for use
 
@@ -170,20 +230,35 @@ def finish_fit(fsw, entries, has_ramdisk=False):
         entries (list of tuple): List of configurations:
             str: Description of model
             str: Compatible stringlist
+            list of int: Sequence numbers of FDTs (fdt-<n>) for this config
+            dict: Optional configuration property/subnode overrides
         has_ramdisk (bool): True if a ramdisk is included in the FIT
     """
     fsw.end_node()
     seq = 0
     with fsw.add_node('configurations'):
-        for model, compat, files in entries:
+        for model, compat, files, props in entries:
             seq += 1
             with fsw.add_node(f'conf-{seq}'):
-                fsw.property('compatible', bytes(compat))
-                fsw.property_string('description', model)
+                if 'compatible' not in props:
+                    fsw.property('compatible', bytes(compat))
+                if 'description' not in props:
+                    fsw.property_string('description', model)
+                subnodes = collections.defaultdict(dict)
+                for pname, pval in props.items():
+                    if '/' in pname:
+                        subnode, subprop = pname.split('/', 1)
+                        subnodes[subnode][subprop] = pval
+                    else:
+                        write_prop(fsw, pname, pval)
                 fsw.property('fdt', bytes(''.join(f'fdt-{x}\x00' for x in files), "ascii"))
                 fsw.property_string('kernel', 'kernel')
                 if has_ramdisk:
                     fsw.property_string('ramdisk', 'ramdisk')
+                for subnode, subprops in subnodes.items():
+                    with fsw.add_node(subnode):
+                        for subprop, pval in subprops.items():
+                            write_prop(fsw, subprop, pval)
     fsw.end_node()
 
 
@@ -322,9 +397,20 @@ def _process_dtbs(args, fsw, entries, fdts):
 
     # First figure out the unique DTB files that need compression
     todo = []
-    file_info = []  # List of (fname, model, compat, files) tuples
+    file_info = []  # List of (fname, model, compat, files, props) tuples
+
+    if args.config:
+        config = parse_config(args.config)
+        by_name = {os.path.basename(fn): fn for fn in args.dtbs}
+        config_dir = os.path.dirname(args.config)
+        dtb_configs = [
+            (by_name.get(dtb, os.path.join(config_dir, dtb)), props)
+            for dtb, props in config.items()
+        ]
+    else:
+        dtb_configs = [(fname, {}) for fname in args.dtbs]
 
-    for fname in args.dtbs:
+    for fname, props in dtb_configs:
         # Ignore non-DTB (*.dtb) files
         if os.path.splitext(fname)[1] != '.dtb':
             continue
@@ -335,7 +421,7 @@ def _process_dtbs(args, fsw, entries, fdts):
             sys.stderr.write(f'Error processing {fname}:\n')
             raise e
 
-        file_info.append((fname, model, compat, files))
+        file_info.append((fname, model, compat, files, props))
         for fn in files:
             if fn not in fdts and fn not in todo:
                 todo.append(fn)
@@ -354,7 +440,7 @@ def _process_dtbs(args, fsw, entries, fdts):
         cache = dict(results)
 
     # Now write all DTBs to the FIT using pre-compressed data
-    for fname, model, compat, files in file_info:
+    for fname, model, compat, files, props in file_info:
         for fn in files:
             if fn not in fdts:
                 seq += 1
@@ -364,7 +450,7 @@ def _process_dtbs(args, fsw, entries, fdts):
                 fdts[fn] = seq
 
         files_seq = [fdts[fn] for fn in files]
-        entries.append([model, compat, files_seq])
+        entries.append([model, compat, files_seq, props])
 
     return seq, size
 
@@ -415,6 +501,9 @@ def build_fit(args):
 def run_make_fit():
     """Run the tool's main logic"""
     args = parse_args()
+    if args.list_dtbs:
+        print(' '.join(parse_config(args.config)))
+        return
 
     out_data, count, size = build_fit(args)
     with open(args.output, 'wb') as outf:
-- 
2.56.0.611.g1030f0b940-goog


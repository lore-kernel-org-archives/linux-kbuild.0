Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60672F84F
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Jul 2026 00:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111391; cv=none; b=I/9Y1YFegd8qtqPTxvL+I4aBjkbYeJH2cygZRH5rFK7XNwE72s5Se+KqbTU5V5UFEhMkf/isydqDIiYfx0W+iYNnZLciyc9MW1Ro+f5crKH3SyMYY8jm/d7jsu9TTmJQwS/HBgcg/iOGczN1tSbZtzqztO4V103IyTqRTl+Voos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111391; c=relaxed/simple;
	bh=i2zx551+g/3yOmTFimci3g0fTX0Tr3rvfUsIHzGhOHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KvpGex2HrHY+En1PygiJ13xMRquVw/GxhjUC32J4o1eDhyNbylIvtSYCYbk3RGZnKst+2qWldopA+m44JprEI8quBPRhH+KO7AbISV6GAykQZfmR5wgpcEKJJr9PBihqkayp025Epc8AfnTx45pn7sM1v2OOMnhprMag0ljy+b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+mKFS4t; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+mKFS4t"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495635a85d2so17863495e9.0
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Jul 2026 17:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785111388; x=1785716188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QnuzTKiGOY/ywudPLpHX93bHErM64Xzt97J5qjWEKX0=;
        b=M+mKFS4tqFjGDyIJS9uCnd+BhpSMjn6BNxUv4q0+oir0hB6PvsIPFRXVg+8zX2DNvo
         T79R+g9yfDpVfKL61rTxMQfs3yMSvOFkMFw0S8XsdiZ+t8AWDDW9Cga035LVsneIQ79B
         3xhDfeLKQobM3lb+8794SASylL0BP+SWTK/Jtz1dOd8Z02QljF2MX/f6McXU04Eqo9Ps
         pbFJrz0cJ2935AfGletEubxxx9D/1TV0ImGCJMrm19s2yV7ZFfh5aB2cB/mQK+5jeJEe
         7zv0OaTrsBwlqGdjPjEzBFSZZje1lR23/hJa7oUpKG6Z62TeEkG7BCi7AqQDEt33B5CO
         OREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111388; x=1785716188;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QnuzTKiGOY/ywudPLpHX93bHErM64Xzt97J5qjWEKX0=;
        b=V8Aa4OtXxbn/xcoO6mEMCUPuHG1dNSgKM5sml2Cvw7IrbfXTNYVcQIfNNOFqCLk+GH
         y/eRZ+Nm3l86P0uf01Xp2cS9n1zlA6Ni4u1rJHHPiVSRq7DwB4/RW4EOvky8T0mdmCCJ
         6lUPx/jeYwTJccbFHXJbwuV4mc4KJ7COUIQj+lt6E1qEsc5fSQeLYuxkjfqdBJg7d4pg
         8eh4VfTwDlj4BRtbuYDJDPpG13LPxcXR6uarGzRCQljcSOflj5iVn50BecvDl7mp3hFZ
         qRydFtZ/95qqqrcb30aNw/VhWLHp3aNDOISGujKWVRuG8e40e6y8tBf5d/wJwAij8tf8
         qgLg==
X-Forwarded-Encrypted: i=1; AHgh+RpYyPVfvv+xQUcsp+GCLsJtB9xq3z2LCOIbUHRHXUSEnPUi1GJyOIAUE5G3gbMzihKDVLyR53hCp6buMqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMEpbEdb36aUsDqgTMhnx5o1qqoh7gUIu9VoL0L6Njws2WZnV0
	ZPdOaPhzq8dih3ifuqTY7v7kcpiJ8RPzxi8+/+sI4Tlbej/06Xmlpgw+
X-Gm-Gg: AR+sD12mZ8GocaHhUKYM6lA0Y4FKeD300hfGc+wVymOsZOgspjNISCxZG8KVHKXUGNw
	VMzbNHdF0kV/j63am3CtHRlk5+qqQKD4Trfia8VZK0dWCJF1yv+xl35cg5PTvBA+HV5q/ON2c2v
	nehYO0RFv0/SgzNdglE24w3tc6dUeOkQy/ujakck/ZD9nyKZvCcluggT+lOBWLyx0kLNrhwEXm8
	yDLME0juYY+TrAh9T5ZjZUoAtPhh4WP0QaI56hVVpUT6ofGAkA6ppZ8UiqjezE0YvBClEBRBvqw
	WhyquGneicB8XyN32/ZxSjdb9wJvPVt9MM4JCymYxajbdFcS6dYEKJW5DFcXSJb+BZ4Y2ZE4KYO
	IJRrpS7pierucDRa3dEbu/mdDolx08Suw55dzdNTerIeG3iHQsVHKs2QYY2Xwhlqgz4q3VLvKQo
	LO9KyF2tIMLVb7F9kuD74AE/1NmY8HLJoKgCkHRsoTes7fYv7ufEsor3BI9iox643R69qjBL9uJ
	uO+
X-Received: by 2002:a05:600c:1d0d:b0:495:4aff:5fdf with SMTP id 5b1f17b1804b1-496b5708144mr86567635e9.28.1785111387742;
        Sun, 26 Jul 2026 17:16:27 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b485f65csm176403555e9.5.2026.07.26.17.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:16:27 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	akpm@linux-foundation.org,
	jani.nikula@linux.intel.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ljs@kernel.org,
	andrew.jones@linux.dev,
	masahiroy@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v4 0/5] add kconfirm
Date: Mon, 27 Jul 2026 01:16:18 +0100
Message-ID: <20260727001623.2794156-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kconfirm now uses the in-tree parser. Making this migration required a
modification to the parser that allows us to observe the parse tree before
its final simplification step, thus allowing us to detect dead code.

Since no external crates are now necessary, I’ve removed the Cargo requirement,
too.

I believe these changes should resolve the major questions, so I’ve
removed the RFC tag.

Now, onto the existing patch-set description since the RFCs:

===

kconfirm is a tool to detect misusage of Kconfig. It detects dead code,
constant conditions, and invalid (reverse) ranges. There are also optional
checks to detect config options that select visible config options, and to
check for dead links in the help texts.

See also kconfirm's original introduction to the mailing list:
https://lore.kernel.org/all/6ec4df6d-1445-48ca-8f54-1d1a83c4716d@gmail.com/

False Alarms:
kconfirm aims for zero false-positives, though this is not completely
feasible due to macro evaluation from the host environment, primarily
affecting host compiler-related options. There will also be some false
positives for dead link checks, as this depends on an internet connection,
and we do not attempt to bypass bot blocks. For this reason, dead link
checking is disabled by default, but I've provided an example below of how
to enable it. Additionally, you can view my previous message to the
mailing list with hand-verified dead links here:
https://lore.kernel.org/all/6732bf08-41ee-40c4-83b2-4ae8bc0da7cf@gmail.com/

Additionally, there is an optional check to detect config options that
select visible config options, as requested by Jani during the review of
the first RFC:
https://lore.kernel.org/all/dcb7439832f0bb35598fba653d922b5f6a4d0058@intel.com/

Even after deduplicating across architectures, there are well over 1,000
instances of these select-visible cases, and I suspect that, despite the
Kconfig documentation saying select-visible should be avoided, some
exceptions will be made. So, I have left this check disabled by default,
keeping in line with the goal of having a low-noise checker. If interested
in using it, I have included an example below of how to enable this check.

Current State of Alarms:
With x86-64 on Linux v7.2-rc4 (which this RFC is based), there are 1282
alarms coming from the default set of checks, and an additional 976 alarms
if enabling the optional select-visible check. The last time I checked
linux-next (next-20260427), there were 81 unique dead links.

The most critical check is the dead default statements, which has surfaced
a few misconfiguration bugs (fortunately, just for kunit tests), see
examples:
https://lore.kernel.org/all/20260323124118.1414913-1-julianbraha@gmail.com/
and:
https://lore.kernel.org/all/20260323123536.1413732-1-julianbraha@gmail.com/

But hopefully kconfirm can ease maintenance and we can prevent more of
these from making it into the tree in the future.

Use it:
You can test out kconfirm with this patch series by compiling and running
kconfirm like this:

`make kconfirm`

To enable the select-visible check:
`KCONFIRM_ARGS="--enable-check select_visible" make kconfirm`

And to enable dead link checks in the help texts:
`KCONFIRM_ARGS="--enable-check dead_link" make kconfirm`

kconfirm by default runs on the same architecture as the kernel build
would. To run kconfirm on another architecture (for example, ARM with an
X86 host):
`ARCH=arm make kconfirm`

Thanks,
Julian Braha
---
Changes since RFC v3:
- Modify kconfig parser to make raw parse tree viewable to enable analysis
- Switch from external parser to in-tree kconfig parser (Demi)
- Add Rust bindings for kconfig
- Remove Cargo and external crates
- Make curl an optional dependency for optional dead link check (Arnd)
- Switch from libcurl to curl CLI for dead link checks (Miguel)
- Adhere to Rust-for-Linux style (Miguel)
- Add tests (Miguel)
- Move kconfirm under scripts/kconfig/ to resolve broken tab autocompletion (Nathan)
- Remove ungrouped attributes style check
- Add support for checking liveness of ftp and git URIs in help texts
- Dropped RFC tag

Link to RFC v3:
https://lore.kernel.org/all/20260516215354.449807-1-julianbraha@gmail.com/

Changes since RFC v2:
- Reduce Rust dependencies significantly (follows Demi's suggestions):
  - from 6 direct dependencies to 1
  - from 107 indirect dependencies to 4
  - Replace ureq crate with usage of system libcurl (thanks Demi)
  - Replace clap crate with FFI bindings to libc's getopt_long (also Demi)
  - Remove crates env_logger, regex
- Switch from vendoring dependencies to requiring users to first download
  outside of Make (as suggested by Miguel)
- Various makefile improvements (as pointed out by Nicolas):
  - Fix out-of-tree builds
  - Only delete kconfirm artifacts with 'distclean' and 'mrproper'
- Add myself as maintainer of kconfirm (as discussed with Nicolas)
- Remove dedicated code license file (pointed out by Jani)
- Update documentation to explain tool setup
- Add hint to users to check documentation and download tool dependencies
- Address sashiko's many code-level and documentation suggestions:
  - Follow the kernel's rust import style
  - Fix a dead_range/duplicate_range alarm mixup
  - Fix potential duplicates in default value style check
  - Avoid panicking on errors
  - Clarify parse failure check usage in documentation 
  - Fix typo in documentation
- Can now enable architectures and disable the default (host) architecture in the CLI

Link to RFC v2:
https://lore.kernel.org/all/20260509203808.1142311-1-julianbraha@gmail.com/

Changes since RFC v1:
- vendored dependencies instead of requiring an internet connection
- removed Cargo.lock
- replaced reqwest dependency with smaller ureq
- removed rustls, expect user to have openssl instead
- added select-visible check based on Jani's feature request
- added invalid (reverse) range check
- deduplicating alarms that appear for multiple architectures
- `make clean` no longer deletes kconfirm's build artifacts
- typo fixes in documentation
- added patch description for the main "add kconfirm" patch (patch 1/2)

Link to RFC v1:
https://lore.kernel.org/all/20260427174429.779474-1-julianbraha@gmail.com/
---

Julian Braha (5):
  kconfig: add add another callback to the parser to view raw parse tree
  kconfig: add kconfirm
  kconfirm: add tests
  Documentation: add kconfirm
  MAINTAINERS: add entry for kconfirm

 Documentation/dev-tools/index.rst             |   1 +
 Documentation/dev-tools/kconfirm.rst          | 229 ++++++
 MAINTAINERS                                   |   7 +
 Makefile                                      |  17 +-
 scripts/kconfig/.gitignore                    |   1 +
 scripts/kconfig/Makefile                      |  54 ++
 scripts/kconfig/kconfig.rs                    | 445 +++++++++++
 scripts/kconfig/kconfirm/.gitignore           |   2 +
 scripts/kconfig/kconfirm/analyze.rs           | 340 ++++++++
 scripts/kconfig/kconfirm/arch.rs              |  53 ++
 scripts/kconfig/kconfirm/checks.rs            | 748 ++++++++++++++++++
 scripts/kconfig/kconfirm/dead_links.rs        | 230 ++++++
 scripts/kconfig/kconfirm/kconfirm-cfg.sh      |  57 ++
 scripts/kconfig/kconfirm/kconfirm.rs          | 278 +++++++
 scripts/kconfig/kconfirm/output.rs            |  87 ++
 scripts/kconfig/kconfirm/symbol_table.rs      | 105 +++
 .../kconfig/kconfirm/tests/arch/arm/Kconfig   |   9 +
 .../kconfirm/tests/arch/powerpc/Kconfig       |   4 +
 .../kconfig/kconfirm/tests/arch/riscv/Kconfig |   9 +
 .../kconfig/kconfirm/tests/arch/sh/Kconfig    |   4 +
 .../kconfirm/tests/arch/testarch/Kconfig      |   4 +
 .../kconfig/kconfirm/tests/arch/um/Kconfig    |   4 +
 .../kconfig/kconfirm/tests/arch/x86/Kconfig   |   4 +
 .../kconfirm/tests/architecture.Kconfig       |   4 +
 .../tests/architecture_common.Kconfig         |  19 +
 .../kconfirm/tests/conditional_prompt.Kconfig |  17 +
 scripts/kconfig/kconfirm/tests/conftest.py    |  93 +++
 ...nt_condition_negative_expression_1.Kconfig |  13 +
 ...nt_condition_negative_expression_2.Kconfig |  13 +
 ...nstant_condition_negative_symbol_1.Kconfig |  13 +
 ...nstant_condition_negative_symbol_2.Kconfig |  13 +
 .../kconfig/kconfirm/tests/dead_link.Kconfig  |  12 +
 .../tests/default_categorization.Kconfig      |  20 +
 scripts/kconfig/kconfirm/tests/pytest.ini     |   2 +
 scripts/kconfig/kconfirm/tests/ranges.Kconfig |  39 +
 .../kconfirm/tests/select_imply.Kconfig       |  28 +
 .../kconfig/kconfirm/tests/test_kconfirm.py   | 358 +++++++++
 scripts/kconfig/lkc_proto.h                   |   2 +
 scripts/kconfig/parser.y                      |  21 +
 39 files changed, 3357 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/dev-tools/kconfirm.rst
 create mode 100644 scripts/kconfig/kconfig.rs
 create mode 100644 scripts/kconfig/kconfirm/.gitignore
 create mode 100644 scripts/kconfig/kconfirm/analyze.rs
 create mode 100644 scripts/kconfig/kconfirm/arch.rs
 create mode 100644 scripts/kconfig/kconfirm/checks.rs
 create mode 100644 scripts/kconfig/kconfirm/dead_links.rs
 create mode 100755 scripts/kconfig/kconfirm/kconfirm-cfg.sh
 create mode 100644 scripts/kconfig/kconfirm/kconfirm.rs
 create mode 100644 scripts/kconfig/kconfirm/output.rs
 create mode 100644 scripts/kconfig/kconfirm/symbol_table.rs
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/arm/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/powerpc/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/riscv/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/sh/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/testarch/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/um/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/arch/x86/Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/architecture.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/architecture_common.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/conditional_prompt.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/conftest.py
 create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_1.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_2.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_1.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_2.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/dead_link.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/default_categorization.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/pytest.ini
 create mode 100644 scripts/kconfig/kconfirm/tests/ranges.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/select_imply.Kconfig
 create mode 100644 scripts/kconfig/kconfirm/tests/test_kconfirm.py

-- 
2.54.0


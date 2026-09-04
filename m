Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5E6481647
	for <linux-kbuild@vger.kernel.org>; Fri,  4 Sep 2026 12:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524963; cv=none; b=MjCAxbekJqutlM0739pdhTd9suKtxQqbcAKLJyKfGezx0VEbEEQ8eTr5akf6xC3uvtYeWeBZ/EsSHTpt+45Y3AK/+EwJZkGz7xh69KRp5chr9VDLmXwdrS+QhWFMcNo+tRoHneEH94ZQcsOpJ2MJHFsLRujnJtRrZkC8spoP7Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524963; c=relaxed/simple;
	bh=EUuoXIfp0lxoOwDJV17UpYFiNpPAfS1N3kozJAP+UaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdzMuHWrKNwg0AtU4dELf/5B49iILxEsSHmNnddYI4nQIEhVypmOHSo8p0r+uTGYk6h9EuF3ns7tDx4euHi/Jc4OPKHYnVNZ1ys+slrZj7torj+/DKdaTcedz3bNGANpG+HRAd1JVYI0+GiMDEGeNeSIhEcXsIKCWkTlWGRK0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRETEh+Z; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRETEh+Z"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482dd6ee390so940005f8f.3
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Sep 2026 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524959; x=1789129759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlGx0CPo5VYNzLkUytiCUbDEjen2hl0scTbalSQRPIc=;
        b=aRETEh+Z/f93pCm1+pVeMdIaZ+EzmPTk4wweH2Yxq2vWB5HKahMobPY8lx4OTFoXlx
         Ad/MfdpFNx5kpEhP6u1nFLqSZWWv1CElqKICHD0YAMmc/mHq3iWdwe4UpZzGGWPswDY0
         Fm9MLrHfSWOTJJOFbKO3W2sHa/jTLJXY7CzlcQAFZw5zV1jdODyokLHaCfyghEfIzhGq
         LoOKN9UmVFjxeWBhPPe7s0EXAH5IYr5qNgyrLJ24EJZoYON0qf2uourRR1LokisD8yFp
         gOD4MhEnj0W9+eL5X7ZGAGAzsAmpHjGRnQKXYLfGzaL75qRc0Aq2kvyHVTUDdP/boO7l
         c9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524959; x=1789129759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qlGx0CPo5VYNzLkUytiCUbDEjen2hl0scTbalSQRPIc=;
        b=pkE0yS/G7NVpSrcl+nPT1L33PUKfUHQyCveJXa+wMTap9Z/EafhnUmhb68VJFXbhKB
         rY/5WpKGKLSx1rUO4avY2RHWG+kFMqnbvffMpGFYkoIkS6PvQzEGRqz41IyUMtuMUzcU
         fB99qOmPWzAcMZlzfM2RwlSZkn0Mjy6NLbICCk/Q3+XXoFblQBXpiFWgTlMcALmyNIhi
         kRq2FA/lcf7RSOIFPLuza2F9GErDSbBl8l3uiCv61wpaKJT57E9i4VBT0MCc+GYWBuLX
         Se0onD7bj2SRdwbmZ0Ml0gLamg1l9bv2Bmm1/00RqQ1ix+bdbgBS+SCWpuccJbZHMZry
         DDQw==
X-Forwarded-Encrypted: i=1; AKwUvBxRYe8tCr+zi87bx//MRfWDOvwJu+cI3r7VwJEyGJuCpblLnIKQQ48tzQHpfnRB82g9oEEi1a5wxaXk0dw=@vger.kernel.org
X-Gm-Message-State: AFuF++l66pngLDBffSWcopsKZt7OvDOZqs4LRv6cNMtmVTpQygpEilKC
	BWYsUNabSKMJIFeuL3X5TiSR7t6O3Mz/DOSPBXvW/ugrJUdiMXyI4ePI
X-Gm-Gg: AYBFou1YjOD+1tXD/h4KkVKJpnA/vflwwfbe1fWCCHDN8l8WY2PmBqhCCJbX/lIUI08
	HpwBdr16jAal/A8DMBWuNPhVxcLpS6ziIVsg8MNAS9HgE2TYtxuLGtRLJTJStKSz5dwJNhP5MRT
	GFrgkq2W3eg3PEbdj7GCVBFJITw0FnMZDIZC6MMLS6+3o+amS1zGnPgW7L+SyQbPV4+067gG7ka
	ug74zJN3YqZ3JrF/yQatuDMYaTyTSAkbuxarfOVqf9XwMWSvvGbO925E+Hz5gej/9VLM8iD26SL
	GusUDH74YUjMdKVDSSfykQKYTtzHhN6sWFueVoLzzbgPHnxjFcsiKVihs5UDJhT+H8H7T0sgA6j
	0byWUIHdsKBrZRU6aWm0gsvJe+3NTXwCsEl9f9KWJg0CttcCP/TQ42ltf3skQ9tl9g9q1XkfuJ4
	dxkNAkP1ef4otsPSQHh/867MKk97OTwcqJH7B1/ae4GKRfHuxblvyxg8OhitqjUdMvYAg8Sj8q+
	xpdNkA9zse813D+9nhk3FOwyWOAHGAKmVqni1juCf5QqEEJEw5G7Hg7zTjiPJ014Ek3
X-Received: by 2002:a5d:5885:0:b0:485:8c16:a32b with SMTP id ffacd0b85a97d-4858c16a55bmr3077939f8f.32.1788524958779;
        Fri, 04 Sep 2026 05:29:18 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm6297105f8f.24.2026.09.04.05.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 05:29:18 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <51ade68e-7a0c-454e-a48a-4c72f7a730ac@gmail.com>
Date: Fri, 4 Sep 2026 13:29:16 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] add kconfirm
To: nathan@kernel.org, nsc@kernel.org
Cc: ojeda@kernel.org, akpm@linux-foundation.org, jani.nikula@linux.intel.com,
 gary@garyguo.net, gregkh@linuxfoundation.org, arnd@arndb.de, ljs@kernel.org,
 andrew.jones@linux.dev, masahiroy@kernel.org, corbet@lwn.net,
 qingfang.deng@linux.dev, demiobenour@gmail.com, ej@inai.de,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260727001623.2794156-1-julianbraha@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260727001623.2794156-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/27/26 01:16, Julian Braha wrote:
> kconfirm now uses the in-tree parser. Making this migration required a
> modification to the parser that allows us to observe the parse tree before
> its final simplification step, thus allowing us to detect dead code.
> 
> Since no external crates are now necessary, I’ve removed the Cargo requirement,
> too.
> 
> I believe these changes should resolve the major questions, so I’ve
> removed the RFC tag.
> 
> Now, onto the existing patch-set description since the RFCs:
> 
> ===
> 
> kconfirm is a tool to detect misusage of Kconfig. It detects dead code,
> constant conditions, and invalid (reverse) ranges. There are also optional
> checks to detect config options that select visible config options, and to
> check for dead links in the help texts.
> 
> See also kconfirm's original introduction to the mailing list:
> https://lore.kernel.org/all/6ec4df6d-1445-48ca-8f54-1d1a83c4716d@gmail.com/
> 
> False Alarms:
> kconfirm aims for zero false-positives, though this is not completely
> feasible due to macro evaluation from the host environment, primarily
> affecting host compiler-related options. There will also be some false
> positives for dead link checks, as this depends on an internet connection,
> and we do not attempt to bypass bot blocks. For this reason, dead link
> checking is disabled by default, but I've provided an example below of how
> to enable it. Additionally, you can view my previous message to the
> mailing list with hand-verified dead links here:
> https://lore.kernel.org/all/6732bf08-41ee-40c4-83b2-4ae8bc0da7cf@gmail.com/
> 
> Additionally, there is an optional check to detect config options that
> select visible config options, as requested by Jani during the review of
> the first RFC:
> https://lore.kernel.org/all/dcb7439832f0bb35598fba653d922b5f6a4d0058@intel.com/
> 
> Even after deduplicating across architectures, there are well over 1,000
> instances of these select-visible cases, and I suspect that, despite the
> Kconfig documentation saying select-visible should be avoided, some
> exceptions will be made. So, I have left this check disabled by default,
> keeping in line with the goal of having a low-noise checker. If interested
> in using it, I have included an example below of how to enable this check.
> 
> Current State of Alarms:
> With x86-64 on Linux v7.2-rc4 (which this RFC is based), there are 1282
> alarms coming from the default set of checks, and an additional 976 alarms
> if enabling the optional select-visible check. The last time I checked
> linux-next (next-20260427), there were 81 unique dead links.
> 
> The most critical check is the dead default statements, which has surfaced
> a few misconfiguration bugs (fortunately, just for kunit tests), see
> examples:
> https://lore.kernel.org/all/20260323124118.1414913-1-julianbraha@gmail.com/
> and:
> https://lore.kernel.org/all/20260323123536.1413732-1-julianbraha@gmail.com/
> 
> But hopefully kconfirm can ease maintenance and we can prevent more of
> these from making it into the tree in the future.
> 
> Use it:
> You can test out kconfirm with this patch series by compiling and running
> kconfirm like this:
> 
> `make kconfirm`
> 
> To enable the select-visible check:
> `KCONFIRM_ARGS="--enable-check select_visible" make kconfirm`
> 
> And to enable dead link checks in the help texts:
> `KCONFIRM_ARGS="--enable-check dead_link" make kconfirm`
> 
> kconfirm by default runs on the same architecture as the kernel build
> would. To run kconfirm on another architecture (for example, ARM with an
> X86 host):
> `ARCH=arm make kconfirm`
> 
> Thanks,
> Julian Braha
> ---
> Changes since RFC v3:
> - Modify kconfig parser to make raw parse tree viewable to enable analysis
> - Switch from external parser to in-tree kconfig parser (Demi)
> - Add Rust bindings for kconfig
> - Remove Cargo and external crates
> - Make curl an optional dependency for optional dead link check (Arnd)
> - Switch from libcurl to curl CLI for dead link checks (Miguel)
> - Adhere to Rust-for-Linux style (Miguel)
> - Add tests (Miguel)
> - Move kconfirm under scripts/kconfig/ to resolve broken tab autocompletion (Nathan)
> - Remove ungrouped attributes style check
> - Add support for checking liveness of ftp and git URIs in help texts
> - Dropped RFC tag
> 
> Link to RFC v3:
> https://lore.kernel.org/all/20260516215354.449807-1-julianbraha@gmail.com/
> 
> Changes since RFC v2:
> - Reduce Rust dependencies significantly (follows Demi's suggestions):
>   - from 6 direct dependencies to 1
>   - from 107 indirect dependencies to 4
>   - Replace ureq crate with usage of system libcurl (thanks Demi)
>   - Replace clap crate with FFI bindings to libc's getopt_long (also Demi)
>   - Remove crates env_logger, regex
> - Switch from vendoring dependencies to requiring users to first download
>   outside of Make (as suggested by Miguel)
> - Various makefile improvements (as pointed out by Nicolas):
>   - Fix out-of-tree builds
>   - Only delete kconfirm artifacts with 'distclean' and 'mrproper'
> - Add myself as maintainer of kconfirm (as discussed with Nicolas)
> - Remove dedicated code license file (pointed out by Jani)
> - Update documentation to explain tool setup
> - Add hint to users to check documentation and download tool dependencies
> - Address sashiko's many code-level and documentation suggestions:
>   - Follow the kernel's rust import style
>   - Fix a dead_range/duplicate_range alarm mixup
>   - Fix potential duplicates in default value style check
>   - Avoid panicking on errors
>   - Clarify parse failure check usage in documentation 
>   - Fix typo in documentation
> - Can now enable architectures and disable the default (host) architecture in the CLI
> 
> Link to RFC v2:
> https://lore.kernel.org/all/20260509203808.1142311-1-julianbraha@gmail.com/
> 
> Changes since RFC v1:
> - vendored dependencies instead of requiring an internet connection
> - removed Cargo.lock
> - replaced reqwest dependency with smaller ureq
> - removed rustls, expect user to have openssl instead
> - added select-visible check based on Jani's feature request
> - added invalid (reverse) range check
> - deduplicating alarms that appear for multiple architectures
> - `make clean` no longer deletes kconfirm's build artifacts
> - typo fixes in documentation
> - added patch description for the main "add kconfirm" patch (patch 1/2)
> 
> Link to RFC v1:
> https://lore.kernel.org/all/20260427174429.779474-1-julianbraha@gmail.com/
> ---
> 
> Julian Braha (5):
>   kconfig: add add another callback to the parser to view raw parse tree
>   kconfig: add kconfirm
>   kconfirm: add tests
>   Documentation: add kconfirm
>   MAINTAINERS: add entry for kconfirm
> 
>  Documentation/dev-tools/index.rst             |   1 +
>  Documentation/dev-tools/kconfirm.rst          | 229 ++++++
>  MAINTAINERS                                   |   7 +
>  Makefile                                      |  17 +-
>  scripts/kconfig/.gitignore                    |   1 +
>  scripts/kconfig/Makefile                      |  54 ++
>  scripts/kconfig/kconfig.rs                    | 445 +++++++++++
>  scripts/kconfig/kconfirm/.gitignore           |   2 +
>  scripts/kconfig/kconfirm/analyze.rs           | 340 ++++++++
>  scripts/kconfig/kconfirm/arch.rs              |  53 ++
>  scripts/kconfig/kconfirm/checks.rs            | 748 ++++++++++++++++++
>  scripts/kconfig/kconfirm/dead_links.rs        | 230 ++++++
>  scripts/kconfig/kconfirm/kconfirm-cfg.sh      |  57 ++
>  scripts/kconfig/kconfirm/kconfirm.rs          | 278 +++++++
>  scripts/kconfig/kconfirm/output.rs            |  87 ++
>  scripts/kconfig/kconfirm/symbol_table.rs      | 105 +++
>  .../kconfig/kconfirm/tests/arch/arm/Kconfig   |   9 +
>  .../kconfirm/tests/arch/powerpc/Kconfig       |   4 +
>  .../kconfig/kconfirm/tests/arch/riscv/Kconfig |   9 +
>  .../kconfig/kconfirm/tests/arch/sh/Kconfig    |   4 +
>  .../kconfirm/tests/arch/testarch/Kconfig      |   4 +
>  .../kconfig/kconfirm/tests/arch/um/Kconfig    |   4 +
>  .../kconfig/kconfirm/tests/arch/x86/Kconfig   |   4 +
>  .../kconfirm/tests/architecture.Kconfig       |   4 +
>  .../tests/architecture_common.Kconfig         |  19 +
>  .../kconfirm/tests/conditional_prompt.Kconfig |  17 +
>  scripts/kconfig/kconfirm/tests/conftest.py    |  93 +++
>  ...nt_condition_negative_expression_1.Kconfig |  13 +
>  ...nt_condition_negative_expression_2.Kconfig |  13 +
>  ...nstant_condition_negative_symbol_1.Kconfig |  13 +
>  ...nstant_condition_negative_symbol_2.Kconfig |  13 +
>  .../kconfig/kconfirm/tests/dead_link.Kconfig  |  12 +
>  .../tests/default_categorization.Kconfig      |  20 +
>  scripts/kconfig/kconfirm/tests/pytest.ini     |   2 +
>  scripts/kconfig/kconfirm/tests/ranges.Kconfig |  39 +
>  .../kconfirm/tests/select_imply.Kconfig       |  28 +
>  .../kconfig/kconfirm/tests/test_kconfirm.py   | 358 +++++++++
>  scripts/kconfig/lkc_proto.h                   |   2 +
>  scripts/kconfig/parser.y                      |  21 +
>  39 files changed, 3357 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/dev-tools/kconfirm.rst
>  create mode 100644 scripts/kconfig/kconfig.rs
>  create mode 100644 scripts/kconfig/kconfirm/.gitignore
>  create mode 100644 scripts/kconfig/kconfirm/analyze.rs
>  create mode 100644 scripts/kconfig/kconfirm/arch.rs
>  create mode 100644 scripts/kconfig/kconfirm/checks.rs
>  create mode 100644 scripts/kconfig/kconfirm/dead_links.rs
>  create mode 100755 scripts/kconfig/kconfirm/kconfirm-cfg.sh
>  create mode 100644 scripts/kconfig/kconfirm/kconfirm.rs
>  create mode 100644 scripts/kconfig/kconfirm/output.rs
>  create mode 100644 scripts/kconfig/kconfirm/symbol_table.rs
>  create mode 100644 scripts/kconfig/kconfirm/tests/arch/arm/Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/arch/powerpc/Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/arch/riscv/Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/arch/sh/Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/arch/testarch/Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/arch/um/Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/arch/x86/Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/architecture.Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/architecture_common.Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/conditional_prompt.Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/conftest.py
>  create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_1.Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_2.Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_1.Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_2.Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/dead_link.Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/default_categorization.Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/pytest.ini
>  create mode 100644 scripts/kconfig/kconfirm/tests/ranges.Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/select_imply.Kconfig
>  create mode 100644 scripts/kconfig/kconfirm/tests/test_kconfirm.py
> 

As I've been getting more comfortable with the in-tree Kconfig
interpreter, I've been wondering if the community might prefer the
gradual integration of lints directly into Kconfig, instead of as a
standalone tool. Similar to a comment by Jani on another patch [1].

Otherwise, I can do a round of self-review and send a v5 for this
series. I already noticed some dumb typos in the subject lines, but any
other feedback on v4 would be welcome if kconfirm is the preferred
route :)

Link:
https://lore.kernel.org/all/f362ddf2e0f3ecf41ed81f03f77577473c3e21bc@intel.com/
[1]

- Julian Braha


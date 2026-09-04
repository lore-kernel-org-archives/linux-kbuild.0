Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC38D514766;
	Fri,  4 Sep 2026 18:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547076; cv=none; b=L2u8JUVrVjYt3UI6q+J+zM+zDoiBUmkAmS7cElWSB71P0YtxGRRUYzbfpn6OrLC+8r1mt80FZ30toX2ccDkLrU3TNJvlHlp7+GGfrzPz7GLkuHwRdJ411K/DIW28sce1rs3Vm7gx6HTKfQKnoztJK7lhGj7V253qP1XctnzHIu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547076; c=relaxed/simple;
	bh=hRB+5JPY9hk5BGC57tDEZlTbRmMl4gg3JciFljNtjas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTCB2MqhcIALoU3N9fI7AGPOS9RKmNg7kNb4EvvOpnrs0fOnDX16I7EDXsOBEexUnzlOw1fvjZIJaqQbgHKnixqytP4ofddzYuN0Xp+sx++KH09xtrpNHbk7UwvWvr8h7ObwQGjyReG9orGocsVetUAMhJlFFMFhqdBhMqNvtjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=K4Xk6Gq5; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="K4Xk6Gq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1788547067; bh=hRB+5JPY9hk5BGC57tDEZlTbRmMl4gg3JciFljNtjas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4Xk6Gq5gKz/FQIb5ZctqQ6xGSIZbxIr7S9R0ecHW/WUclbwAAeFBVboRYQeR8nm1
	 Ix5kT1swq8rjMmp+Y6mKQThWQy8Y6ZBB4u2/6rvHnLFU5bSQSTewRILBltpuxltpWh
	 9VS3tGm1VKOaJWdbu5WqzWwuEW5n/sfHVgHOWGxSbd1gqGFh+lMwYKXtwoPl+ICo4S
	 VETIVKp9ZXmV7dy5+jzZWEEShgQaBNPOrz3RqL9o08Rh/abLSCwhTBufhwAyOU1fkj
	 CnIZaJTUiFgh5vHdszWCsSfWb9DT8swbFyddX5h68QErMt2IhKlOhGVsndZL0rPOuE
	 xzEZ99toTNHQQ==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a9b0ffb-2a57-7f0000032729-7f000001894a-1
	for <multiple-recipients>; Fri, 04 Sep 2026 20:37:47 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri,  4 Sep 2026 20:37:47 +0200 (CEST)
Date: Fri, 4 Sep 2026 20:37:47 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, ojeda@kernel.org, akpm@linux-foundation.org,
	jani.nikula@linux.intel.com, gary@garyguo.net,
	gregkh@linuxfoundation.org, arnd@arndb.de, ljs@kernel.org,
	andrew.jones@linux.dev, masahiroy@kernel.org, corbet@lwn.net,
	qingfang.deng@linux.dev, demiobenour@gmail.com, ej@inai.de,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v4 0/5] add kconfirm
Message-ID: <20260904-fine-ethereal-bee-ef5ad9@l-nschier-aarch64>
References: <20260727001623.2794156-1-julianbraha@gmail.com>
 <51ade68e-7a0c-454e-a48a-4c72f7a730ac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51ade68e-7a0c-454e-a48a-4c72f7a730ac@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1788547067-61CAB64C-D0948B84/0/0
X-purgate-type: clean
X-purgate-size: 12629
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: 30354A0379  external: no

On Fri, Sep 04, 2026 at 01:29:16PM +0100, Julian Braha wrote:
> On 7/27/26 01:16, Julian Braha wrote:
> > kconfirm now uses the in-tree parser. Making this migration required a
> > modification to the parser that allows us to observe the parse tree before
> > its final simplification step, thus allowing us to detect dead code.
> > 
> > Since no external crates are now necessary, I’ve removed the Cargo requirement,
> > too.
> > 
> > I believe these changes should resolve the major questions, so I’ve
> > removed the RFC tag.
> > 
> > Now, onto the existing patch-set description since the RFCs:
> > 
> > ===
> > 
> > kconfirm is a tool to detect misusage of Kconfig. It detects dead code,
> > constant conditions, and invalid (reverse) ranges. There are also optional
> > checks to detect config options that select visible config options, and to
> > check for dead links in the help texts.
> > 
> > See also kconfirm's original introduction to the mailing list:
> > https://lore.kernel.org/all/6ec4df6d-1445-48ca-8f54-1d1a83c4716d@gmail.com/
> > 
> > False Alarms:
> > kconfirm aims for zero false-positives, though this is not completely
> > feasible due to macro evaluation from the host environment, primarily
> > affecting host compiler-related options. There will also be some false
> > positives for dead link checks, as this depends on an internet connection,
> > and we do not attempt to bypass bot blocks. For this reason, dead link
> > checking is disabled by default, but I've provided an example below of how
> > to enable it. Additionally, you can view my previous message to the
> > mailing list with hand-verified dead links here:
> > https://lore.kernel.org/all/6732bf08-41ee-40c4-83b2-4ae8bc0da7cf@gmail.com/
> > 
> > Additionally, there is an optional check to detect config options that
> > select visible config options, as requested by Jani during the review of
> > the first RFC:
> > https://lore.kernel.org/all/dcb7439832f0bb35598fba653d922b5f6a4d0058@intel.com/
> > 
> > Even after deduplicating across architectures, there are well over 1,000
> > instances of these select-visible cases, and I suspect that, despite the
> > Kconfig documentation saying select-visible should be avoided, some
> > exceptions will be made. So, I have left this check disabled by default,
> > keeping in line with the goal of having a low-noise checker. If interested
> > in using it, I have included an example below of how to enable this check.
> > 
> > Current State of Alarms:
> > With x86-64 on Linux v7.2-rc4 (which this RFC is based), there are 1282
> > alarms coming from the default set of checks, and an additional 976 alarms
> > if enabling the optional select-visible check. The last time I checked
> > linux-next (next-20260427), there were 81 unique dead links.
> > 
> > The most critical check is the dead default statements, which has surfaced
> > a few misconfiguration bugs (fortunately, just for kunit tests), see
> > examples:
> > https://lore.kernel.org/all/20260323124118.1414913-1-julianbraha@gmail.com/
> > and:
> > https://lore.kernel.org/all/20260323123536.1413732-1-julianbraha@gmail.com/
> > 
> > But hopefully kconfirm can ease maintenance and we can prevent more of
> > these from making it into the tree in the future.
> > 
> > Use it:
> > You can test out kconfirm with this patch series by compiling and running
> > kconfirm like this:
> > 
> > `make kconfirm`
> > 
> > To enable the select-visible check:
> > `KCONFIRM_ARGS="--enable-check select_visible" make kconfirm`
> > 
> > And to enable dead link checks in the help texts:
> > `KCONFIRM_ARGS="--enable-check dead_link" make kconfirm`
> > 
> > kconfirm by default runs on the same architecture as the kernel build
> > would. To run kconfirm on another architecture (for example, ARM with an
> > X86 host):
> > `ARCH=arm make kconfirm`
> > 
> > Thanks,
> > Julian Braha
> > ---
> > Changes since RFC v3:
> > - Modify kconfig parser to make raw parse tree viewable to enable analysis
> > - Switch from external parser to in-tree kconfig parser (Demi)
> > - Add Rust bindings for kconfig
> > - Remove Cargo and external crates
> > - Make curl an optional dependency for optional dead link check (Arnd)
> > - Switch from libcurl to curl CLI for dead link checks (Miguel)
> > - Adhere to Rust-for-Linux style (Miguel)
> > - Add tests (Miguel)
> > - Move kconfirm under scripts/kconfig/ to resolve broken tab autocompletion (Nathan)
> > - Remove ungrouped attributes style check
> > - Add support for checking liveness of ftp and git URIs in help texts
> > - Dropped RFC tag
> > 
> > Link to RFC v3:
> > https://lore.kernel.org/all/20260516215354.449807-1-julianbraha@gmail.com/
> > 
> > Changes since RFC v2:
> > - Reduce Rust dependencies significantly (follows Demi's suggestions):
> >   - from 6 direct dependencies to 1
> >   - from 107 indirect dependencies to 4
> >   - Replace ureq crate with usage of system libcurl (thanks Demi)
> >   - Replace clap crate with FFI bindings to libc's getopt_long (also Demi)
> >   - Remove crates env_logger, regex
> > - Switch from vendoring dependencies to requiring users to first download
> >   outside of Make (as suggested by Miguel)
> > - Various makefile improvements (as pointed out by Nicolas):
> >   - Fix out-of-tree builds
> >   - Only delete kconfirm artifacts with 'distclean' and 'mrproper'
> > - Add myself as maintainer of kconfirm (as discussed with Nicolas)
> > - Remove dedicated code license file (pointed out by Jani)
> > - Update documentation to explain tool setup
> > - Add hint to users to check documentation and download tool dependencies
> > - Address sashiko's many code-level and documentation suggestions:
> >   - Follow the kernel's rust import style
> >   - Fix a dead_range/duplicate_range alarm mixup
> >   - Fix potential duplicates in default value style check
> >   - Avoid panicking on errors
> >   - Clarify parse failure check usage in documentation 
> >   - Fix typo in documentation
> > - Can now enable architectures and disable the default (host) architecture in the CLI
> > 
> > Link to RFC v2:
> > https://lore.kernel.org/all/20260509203808.1142311-1-julianbraha@gmail.com/
> > 
> > Changes since RFC v1:
> > - vendored dependencies instead of requiring an internet connection
> > - removed Cargo.lock
> > - replaced reqwest dependency with smaller ureq
> > - removed rustls, expect user to have openssl instead
> > - added select-visible check based on Jani's feature request
> > - added invalid (reverse) range check
> > - deduplicating alarms that appear for multiple architectures
> > - `make clean` no longer deletes kconfirm's build artifacts
> > - typo fixes in documentation
> > - added patch description for the main "add kconfirm" patch (patch 1/2)
> > 
> > Link to RFC v1:
> > https://lore.kernel.org/all/20260427174429.779474-1-julianbraha@gmail.com/
> > ---
> > 
> > Julian Braha (5):
> >   kconfig: add add another callback to the parser to view raw parse tree
> >   kconfig: add kconfirm
> >   kconfirm: add tests
> >   Documentation: add kconfirm
> >   MAINTAINERS: add entry for kconfirm
> > 
> >  Documentation/dev-tools/index.rst             |   1 +
> >  Documentation/dev-tools/kconfirm.rst          | 229 ++++++
> >  MAINTAINERS                                   |   7 +
> >  Makefile                                      |  17 +-
> >  scripts/kconfig/.gitignore                    |   1 +
> >  scripts/kconfig/Makefile                      |  54 ++
> >  scripts/kconfig/kconfig.rs                    | 445 +++++++++++
> >  scripts/kconfig/kconfirm/.gitignore           |   2 +
> >  scripts/kconfig/kconfirm/analyze.rs           | 340 ++++++++
> >  scripts/kconfig/kconfirm/arch.rs              |  53 ++
> >  scripts/kconfig/kconfirm/checks.rs            | 748 ++++++++++++++++++
> >  scripts/kconfig/kconfirm/dead_links.rs        | 230 ++++++
> >  scripts/kconfig/kconfirm/kconfirm-cfg.sh      |  57 ++
> >  scripts/kconfig/kconfirm/kconfirm.rs          | 278 +++++++
> >  scripts/kconfig/kconfirm/output.rs            |  87 ++
> >  scripts/kconfig/kconfirm/symbol_table.rs      | 105 +++
> >  .../kconfig/kconfirm/tests/arch/arm/Kconfig   |   9 +
> >  .../kconfirm/tests/arch/powerpc/Kconfig       |   4 +
> >  .../kconfig/kconfirm/tests/arch/riscv/Kconfig |   9 +
> >  .../kconfig/kconfirm/tests/arch/sh/Kconfig    |   4 +
> >  .../kconfirm/tests/arch/testarch/Kconfig      |   4 +
> >  .../kconfig/kconfirm/tests/arch/um/Kconfig    |   4 +
> >  .../kconfig/kconfirm/tests/arch/x86/Kconfig   |   4 +
> >  .../kconfirm/tests/architecture.Kconfig       |   4 +
> >  .../tests/architecture_common.Kconfig         |  19 +
> >  .../kconfirm/tests/conditional_prompt.Kconfig |  17 +
> >  scripts/kconfig/kconfirm/tests/conftest.py    |  93 +++
> >  ...nt_condition_negative_expression_1.Kconfig |  13 +
> >  ...nt_condition_negative_expression_2.Kconfig |  13 +
> >  ...nstant_condition_negative_symbol_1.Kconfig |  13 +
> >  ...nstant_condition_negative_symbol_2.Kconfig |  13 +
> >  .../kconfig/kconfirm/tests/dead_link.Kconfig  |  12 +
> >  .../tests/default_categorization.Kconfig      |  20 +
> >  scripts/kconfig/kconfirm/tests/pytest.ini     |   2 +
> >  scripts/kconfig/kconfirm/tests/ranges.Kconfig |  39 +
> >  .../kconfirm/tests/select_imply.Kconfig       |  28 +
> >  .../kconfig/kconfirm/tests/test_kconfirm.py   | 358 +++++++++
> >  scripts/kconfig/lkc_proto.h                   |   2 +
> >  scripts/kconfig/parser.y                      |  21 +
> >  39 files changed, 3357 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/dev-tools/kconfirm.rst
> >  create mode 100644 scripts/kconfig/kconfig.rs
> >  create mode 100644 scripts/kconfig/kconfirm/.gitignore
> >  create mode 100644 scripts/kconfig/kconfirm/analyze.rs
> >  create mode 100644 scripts/kconfig/kconfirm/arch.rs
> >  create mode 100644 scripts/kconfig/kconfirm/checks.rs
> >  create mode 100644 scripts/kconfig/kconfirm/dead_links.rs
> >  create mode 100755 scripts/kconfig/kconfirm/kconfirm-cfg.sh
> >  create mode 100644 scripts/kconfig/kconfirm/kconfirm.rs
> >  create mode 100644 scripts/kconfig/kconfirm/output.rs
> >  create mode 100644 scripts/kconfig/kconfirm/symbol_table.rs
> >  create mode 100644 scripts/kconfig/kconfirm/tests/arch/arm/Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/arch/powerpc/Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/arch/riscv/Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/arch/sh/Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/arch/testarch/Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/arch/um/Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/arch/x86/Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/architecture.Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/architecture_common.Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/conditional_prompt.Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/conftest.py
> >  create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_1.Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_expression_2.Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_1.Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/constant_condition/default_constant_condition_negative_symbol_2.Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/dead_link.Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/default_categorization.Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/pytest.ini
> >  create mode 100644 scripts/kconfig/kconfirm/tests/ranges.Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/select_imply.Kconfig
> >  create mode 100644 scripts/kconfig/kconfirm/tests/test_kconfirm.py
> > 
> 
> As I've been getting more comfortable with the in-tree Kconfig
> interpreter, I've been wondering if the community might prefer the
> gradual integration of lints directly into Kconfig, instead of as a
> standalone tool. Similar to a comment by Jani on another patch [1].

Yes, I'd prefer if in-tree Kconfig is improved to find more mistakes in 
Kconfig files itself.

Thanks for keeping up!

Kind regards,
Nicolas

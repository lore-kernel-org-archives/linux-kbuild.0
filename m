Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690592;
	b=ic/duQZ2DZWBiXyOS/ZFKGE29Seo4IwnwLhN1ji1MluQesZoWnmozCnz+EBz4e67Dipv
	 p9tkk4MRC3WrpwiBVnncWwz3g0pthSU4ykFKZssMsJ9/YRM5OXsD3dr6pWP7drlQONzQ1
	 BPraZu1ny8r277lD597DKRSXUv+P+JxVWqX+LoMaHMihbGenKKKZQpb3dADMHtHCegei9
	 5okDYXcJ+fttfGhSJ4RYoOtfXny/hgiskifn5R95thVJlFNxd8DWkmGwvUWufEVPWNu2Y
	 YEUIKxbCWLQ9xdjh0lf2afbeLeh0FcYZKUnvsDySItuL/0OOXOnjsd5iotY5vgCvCuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690592;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/31kFSZ+eRDqgUopjz+B5MGJf8WSI3fqeWtC2wOjRVg=;
	b=WBa+oOWdEQ6N3T2uN6T/t93e7PW8uISVEbGl7JyxNjFoAwCSKv32UWw3IrClf9Ik7rH9
	 ZIrvnOYj1pBnfM3R9elUi/lZS+hwIuPTzVRoBJTTf+dpv6aZNASMp3vgnDKCLzRqchC92
	 EPnnR1i1Y5APIlnzpMtXLd1D6Ufku8tH81xlfEV6Lgr/7dwb9wuMRSLEBdMAwGDQEWnf2
	 s6w1iu7DNqcC6R1wVLVL1MWOIGkWnaVL1MECKgzKy4M8JAsKqmmbft55Og6dewYLfxesQ
	 toHws9Y5R7hGZe5d8iEF7rpJ4EIu7y2FEUMfJadVcdpxja1eGBYkEYifD/DbqUCDzwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gLrvfee6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AC9606A327;
	Sat, 14 Nov 2026 21:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gLrvfee6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B32E1F000C4;
	Sat, 14 Nov 2026 21:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794690591;
	bh=/31kFSZ+eRDqgUopjz+B5MGJf8WSI3fqeWtC2wOjRVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gLrvfee6AkBl57/USM6tcT5dTfBUc47KM6dfZZv4eC6svKeay4goXE1Pa5xpQ3xuw
	 UgwpsVbFzJgz8VhYbGbPtbAo3AZnl32nJyaGzHwi+NZRbrsfRX1vtZcGvT6bqeSuww
	 OT23yAtvmtXJUNut2RNwTjH1fJNlYW+gxIsKD2JNsvOjqPx3+FnOM1UIVOeJC6kGM+
	 gB50e6tuBVkNj8+UxyAMtpY90RsvgcuGsEo+XthzZTna2KYiFqCR7ZG5cbGCtF+KMp
	 vuPi8fG9c+aEHiXMs4YfBG+Cl02K0nv76QGva+ldiPUz3NfpFGxBxsGGdlkgBV17DD
	 iPIMy0cZa1WYw==
Message-ID: <sashiko-outbox-215033@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 2/5] kbuild: fit: Support selecting DTBs and
 config properties from a file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Douglas Anderson" <dianders@chromium.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>
Cc: "Julius Werner" <jwerner@chromium.org>, "Michal Simek" <michal.simek@amd.com>,
 =?utf-8?b?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>, "Simon Glass" <sjg@chromium.org>, "Peter
 Griffin" <peter.griffin@linaro.org>, linux-kbuild@vger.kernel.org, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Chen-Yu Tsai" <wenst@chromium.org>, "Will
 Deacon" <will@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, Devicetree@vger.kernel.org, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Nicolas Schier" <nsc@kernel.org>, "Saravana
 Kannan" <saravanak@kernel.org>, "Brian Norris" <briannorris@chromium.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Jonathan Corbet" <corbet@lwn.net>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, =?utf-8?b?TG9yZW56byBTdG9ha2VzIChBUk0p?= <ljs@kernel.org>, "Manuel
 Ebner" <manuelebnerli@mailbox.org>, "Marco Elver" <elver@google.com>, "Mark
 Rutland" <mark.rutland@arm.com>, "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
 =?utf-8?b?UGV0ZXIgWmlqbHN0cmEgKEludGVsKQ==?= <peterz@infradead.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Rong Xu" <xur@google.com>, "Shuah Khan" <skhan@linuxfoundation.org>
In-Reply-To: <20261113130858.RFC.v2.2.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
References: <20261113210918.356261-1-dianders@chromium.org>
 <20261113130858.RFC.v2.2.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 21:09:49 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] kbuild: fit: leading ./ in FIT_CONFIG_DTBS breaks
  Makefile.dtbs matching
- [Medium] kbuild: fit: basename lookup in _process_dtbs() breaks O=3D
  subdir DTBs
--

commit 7793aa0a3f31c2e79bf996dd2bb1dcd0d8affc8c
Author: Douglas Anderson <dianders@chromium.org>

kbuild: fit: Support selecting DTBs and config properties from a file

This commit adds support for a FIT_CONFIG make variable pointing to a
.fitconfig file that selects which DTBs to build and include in image.fit
and sets properties or subnodes on /configurations/conf-N nodes.

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> index c4e4663902844..cc14fc905ea3b 100644
> --- a/scripts/Makefile.dtbs
> +++ b/scripts/Makefile.dtbs
> @@ -5,6 +5,15 @@ all-dtb :=3D $(dtb-y) $(dtb-)
>  # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
>  dtb-$(CONFIG_OF_ALL_DTBS) +=3D $(dtb-)
> =20
> +# If FIT_CONFIG is specified, restrict $(dtb-y) to only the DTBs listed =
in
> +# $(FIT_CONFIG_FILE).
> +ifdef FIT_CONFIG_FILE
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +dtb-y :=3D $(filter $(all-dtb), \
> +	$(patsubst $(obj)/%, %, $(filter $(obj)/%, $(FIT_CONFIG_DTBS))))
> +endif
> +endif
> +
>  # Composite DTB (i.e. DTB constructed by overlay)
>  multi-dtb-y :=3D $(call multi-search, $(dtb-y), .dtb, -dtbs)
>  # Primitive DTB compiled from *.dts
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 19e96b30a122f..e08e35d4ed747 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -427,8 +427,33 @@ quiet_cmd_fit =3D FIT     $@
>  		--name '$(UIMAGE_NAME)' $(FIT_EXTRA_ARGS) \
>  		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
>  		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> +		$(if $(FIT_CONFIG_FILE),--config $(FIT_CONFIG_FILE)) \
>  		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
> =20
> +# If FIT_CONFIG is specified on the command line (either relative to $(s=
rctree)
> +# or relative to arch/$(SRCARCH)/boot/dts/), locate that file and extrac=
t the
> +# list of .dtb files to build.
> +ifdef FIT_CONFIG
> +FIT_CONFIG_REL :=3D $(firstword $(patsubst $(abs_srctree)/%,%,\
> +	$(patsubst $(srctree)/%,%,$(patsubst ./%,%,$(wildcard \
> +	$(FIT_CONFIG) \
> +	$(srctree)/$(FIT_CONFIG) \
> +	$(srctree)/arch/$(SRCARCH)/boot/dts/$(FIT_CONFIG))))))
> +ifeq ($(FIT_CONFIG_REL),)
> +$(error FIT_CONFIG '$(FIT_CONFIG)' not found)
> +endif
> +FIT_CONFIG_FILE :=3D $(srctree)/$(FIT_CONFIG_REL)
> +ifndef FIT_CONFIG_DTBS
> +export FIT_CONFIG_DTBS :=3D $(addprefix $(dir $(FIT_CONFIG_REL)), \
> +	$(shell $(MAKE_FIT) -C $(FIT_CONFIG_FILE) --list-dtbs))
> +$(if $(FIT_CONFIG_DTBS),,$(error Failed to parse DTB list from $(FIT_CON=
FIG_FILE)))
> +endif

[Severity: Medium]
Does $(dir $(FIT_CONFIG_REL)) prepend a leading ./ to every entry in
FIT_CONFIG_DTBS when FIT_CONFIG points to a file in the root of $(srctree)?

When FIT_CONFIG_REL has no slash (or when FIT_CONFIG is passed with a
leading ./ in an out-of-tree build so $(patsubst ./%,%,...) runs before
$(srctree)/ is stripped), $(dir $(FIT_CONFIG_REL)) evaluates to ./.  In
scripts/Makefile.dtbs, $(filter $(obj)/%, $(FIT_CONFIG_DTBS)) compares
against $(obj) without a leading ./, so nothing matches, dtb-y is cleared
across all DTS directories, and no DTBs are built.  Stripping ./ from
$(dir $(FIT_CONFIG_REL)) and running $(patsubst ./%,%,...) after stripping
$(srctree)/ and $(abs_srctree)/ would avoid this.

[ ... ]

> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> index 9bd35aa721191..0c0af80426411 100755
> --- a/scripts/make_fit.py
> +++ b/scripts/make_fit.py

[ ... ]

> @@ -322,9 +397,20 @@ def _process_dtbs(args, fsw, entries, fdts):
> =20
>      # First figure out the unique DTB files that need compression
>      todo =3D []
> -    file_info =3D []  # List of (fname, model, compat, files) tuples
> +    file_info =3D []  # List of (fname, model, compat, files, props) tup=
les
> +
> +    if args.config:
> +        config =3D parse_config(args.config)
> +        by_name =3D {os.path.basename(fn): fn for fn in args.dtbs}
> +        config_dir =3D os.path.dirname(args.config)
> +        dtb_configs =3D [
> +            (by_name.get(dtb, os.path.join(config_dir, dtb)), props)
> +            for dtb, props in config.items()
> +        ]
> +    else:
> +        dtb_configs =3D [(fname, {}) for fname in args.dtbs]

[Severity: Medium]
Will by_name.get(dtb, ...) always miss in out-of-tree (O=3D) builds when a
.fitconfig section header includes a subdirectory path such as
[google/lga-blazer.dtb]?

by_name is keyed by os.path.basename(fn), so any dtb key containing a
slash never matches and falls back to os.path.join(config_dir, dtb).
Because scripts/Makefile.lib sets FIT_CONFIG_FILE in $(srctree),
config_dir points into the source tree rather than $(objtree) where the
compiled .dtb and .dtb.cmd files live, causing process_dtb() to fail with
FileNotFoundError.  Looking up os.path.basename(dtb) (or matching the
suffix against args.dtbs) would find the built DTB in $(objtree).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113210918.3562=
61-1-dianders@chromium.org?part=3D2

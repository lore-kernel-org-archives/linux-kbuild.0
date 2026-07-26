Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3042D7DC4
	for <linux-kbuild@vger.kernel.org>; Sun, 26 Jul 2026 03:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785037064; cv=pass; b=cu+rUhCq28mDNMSasd34ojExFPB6r53c5laE3YZR/mg+WNc7kF5Pi0Etiz+DS02NnNbUYJOLE5FWyCBMSvKhKlksYKtf9b4/DgrgfVvrgoobVfYMSlMFMa679kto6BlRF21QAtb5cal0qQdxf1vtzxCQo8JIyfIz6DTV9HVyDWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785037064; c=relaxed/simple;
	bh=fTfaM/m5eth5+/adQosBlmcjroxc67yWQ+mOFZi9wBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YncQ1OwFTo7jTo0W8Q3+/jYBleTAvRxMAey5Mm6Qx8NGddWqmOOPNksiGbAJfqWCwTtRW9sGJIipsjSOrVVrxcX7eKmf48POJN48ZOnZFuToMFzkDJqkDLUAco/2kSJh+ZJEHudKsgU/zZT3BsZom9ScJmKch0bYX8Ab0S9X0IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fa9C95Wn; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fa9C95Wn"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81e83f1f15aso19813487b3.1
        for <linux-kbuild@vger.kernel.org>; Sat, 25 Jul 2026 20:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785037061; cv=none;
        d=google.com; s=arc-20260327;
        b=pQ2I5QsyAPmtjCBsWGHj+8gJEpQQcTAQfRvWmtFWcVueEH6fVFJ/mJYNtjKQD0Sjop
         tpW5IAAVq/3bRLYtdyLGvaQi/i3EMRuV5CQBRQT3tNdA4yTzbC4NVMtemLflrWHPVOR7
         kXcWGF4pK+PpZnS2tt70vIoh75ftk8E/UtMLdCcaOs9JN3+Rg/SAG3v4Weiwtd8xQmvX
         3+g4Lr0i/OUPX3MR3gp2fu57sNPImghc0laDoaujfe6p4ccaXvcr3S0wshAeXtoJ7PDy
         Y6NwsYPfDYJc0A2fya2j3hmahKFKz+2JKlgUcsVfuOhGJtMea83SN7jmrGwvnSznanlw
         RMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CxEX9l/T7AwZAVrm4P1IE7GYezPpkQz92l8M6dbRYJE=;
        fh=VFtksUf0rXMB41q/He5v70q4tR5gDmwJEfKWKhUqnf0=;
        b=aYHURTfrw9EQopeWFFMvodigfCwHPAZzOJJFefZHiGNv4vjb6lPIHPUVnKmj3geXCO
         CwUz08tVSlvUtKaV0LLFu0oZ2v7dcvJ1Owot8yGaLjwF8aPq+K5mKPtfWYzYY8ujD287
         PivKaiBHoIdKK1autD4oQxgjrWidN0bAuk64c3rci07JShsYrDZ1NUikjouz+zFPtSLp
         Hs2nNK4taf5YjWrHlPS6gVBw20GIN5v9psonfHOB0A4okFOJiMMZhWsaJdHLQ8torzW9
         D+IKojnttXaI5Tjv1ZFYmALCOP+cUkHjpxVW+oYOsuSdhE25AtxeRZw9UuA013frhmId
         L4tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785037061; x=1785641861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CxEX9l/T7AwZAVrm4P1IE7GYezPpkQz92l8M6dbRYJE=;
        b=fa9C95WnrHxHYrVKtKoaU5+51AgQ3f+BKAdtGuUiPLMa8vFZRwPc0TfUGlbq2uaTyS
         pGcvEd5kr9Adcj8u2KK3G79rNiBZSYGkw1wH2wawL0xTkp5HybRH1TvXR1Ygp5YxySxc
         5ye8kbKcWLNrV79JUo9fBUUc/Q0sDWzUDugFS52JFM1wcqe4zrTRblAa2OrRqm1GxMA9
         DP9iHbu0xH/+uO00DILQfaxFKxkEQDJLx6nOstnsLYY6P5alGheIr/9VnAH/9EsNmrT0
         vSvI42Pp4g9kJ1JTV0/2V6kpNWZMBXEelJb8jZYM9O2bKlXbeql+QrIFGk0m5i8OB3QD
         g44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785037061; x=1785641861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxEX9l/T7AwZAVrm4P1IE7GYezPpkQz92l8M6dbRYJE=;
        b=Md4fmryBFNKbmwyh5iYIdaN4MSNrqKXKXGXTymLvt0GVITStTPsi3F1LL0T6JMLvAS
         6OsYPRa3pGM4NfhKxMb36v+2/gZK/OMOqOiOz4SGFijg/8zxYeT4xurTe0aQcoMsmLXA
         myLnBQkly5jpCyogyndsgTQkrNyudB121REKWXVFc0qmdW210HyKAf0o6JDWeX2ao+8K
         OJJ9nwELPlSpVCa6B0YoDB6ZaWofet7IxFhObSSOWGZJHQvLt4W50SvOVN3y9rolbgzT
         MlDbUmlG+bE5t+XKkFgjTuGt10ea4wM1BhNRBbWPxxgsMdDMAcdNEbzNzsWheOg4RsRW
         jTNg==
X-Forwarded-Encrypted: i=1; AHgh+RrJ7+rmIwXCk+EjhSPZqdXQIGYiIuTNikdoP5kzKuR3fBeByjGzjjAQFsmUtWp1sviy/oi3+eJpkDwQsII=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZO/hnchnnmR9sTlDbvKW7JuQsdducGd72Df/L8e1a77v/otmv
	ZLvGzkWdFwhKUv6QQuH6Nag3DzmSPBG0xOR96fXkTOiBImChQaeoIEpQ6PgODLXuIteDxsek83L
	72t4Sw1G7ffmzCt7IY8uRh3ezJ4Wi414=
X-Gm-Gg: AR+sD111Mrajc8l/xcWV9D1CETNlxMEUt6GiY9mUohEzcEv1xYNqZXmReAsHuDu3XE1
	SOWfuazWjdKuA3xbasnIstzDllpHKqocQGSMeVazx3Bxvf7kn3Cio1qZLXOReTXNvtwaYcAn5at
	sEsIFaiRsxZ4DWmdUrOjQnBZOTsjSjGBoLknPdCH2UgoyY8msFMrDbXE3k5SElQDrbuZBrHBj0M
	pfGmseA0pjKXbpedoWnw2tAGZSHwRhmhcAHikIC2uWVUS5H74Irdg6Z/2m4Mzvfrc5b2wvlNo4p
	OA64vjIUXK+9tw9g+Cs=
X-Received: by 2002:a05:690c:348a:b0:81e:a373:47ad with SMTP id
 00721157ae682-81f63a35b07mr18584747b3.2.1785037060800; Sat, 25 Jul 2026
 20:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726025242.42245-1-laoar.shao@gmail.com> <20260726030312.DF6191F000E9@smtp.kernel.org>
In-Reply-To: <20260726030312.DF6191F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 26 Jul 2026 11:37:04 +0800
X-Gm-Features: AUfX_mwt8E90lNcOVfM9z4AERgcnP9BvBrSTgl0T4KAQiDtTFQf9Yy2WrE4eLIA
Message-ID: <CALOAHbB0w+eK6Bxd+Lsb51Z5QVtnNv=4Srbb7KWcm6zAxgkTwA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rpm-pkg: Preserve .BTF section in kernel
 modules during debuginfo stripping
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2026 at 11:03=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The patch preserves the `.BTF` section during debuginfo strippin=
g but fails to also preserve the `.BTF.base` section, causing module BTF va=
lidation to fail.
> --
>
> --- Patch [1]: [PATCH v3] kbuild: rpm-pkg: Preserve .BTF section in kerne=
l modules during debuginfo stripping ---
> commit cd09ed46074d0224c00066939452278fca769e51
> Author: Yafang Shao <laoar.shao@gmail.com>
> kbuild: rpm-pkg: Preserve .BTF section in kernel modules during debuginfo=
 stripping
>
> This commit updates the RPM build scripts to pass --keep-section .BTF to
> find-debuginfo.sh. This prevents eu-strip from dropping the .BTF section
> from kernel modules during debuginfo extraction.
>
> > diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> > index c732415662ef2..1032f337a71cd 100644
> > --- a/scripts/package/kernel.spec
> > +++ b/scripts/package/kernel.spec
>
> [ ... ]
>
> > @@ -67,7 +67,17 @@ This package provides debug information for the kern=
el image and modules from th
> >  %undefine _unique_debug_srcs
> >  %undefine _debugsource_packages
> >  %undefine _debuginfo_subpackages
> > +
> > +# Preserve .BTF section in kernel modules during debuginfo stripping
> > +# find-debuginfo.sh (from debugedit) uses eu-strip which removes
> > +# non-allocated ELF sections like .BTF by default.
> > +%global with_keep_section %(%{__find_debuginfo} --help 2>&1 | grep -c =
keep-section)
> > +%if %{with_keep_section}
> > +%global _find_debuginfo_opts -r --keep-section .BTF
>
> [Severity: High]
> Does this also need to preserve the .BTF.base section?
>
> When modules are built with BTF distillation (which is standard on recent
> kernels), both .BTF and .BTF.base sections are generated. If .BTF.base is
> stripped, btf_parse_module() in kernel/bpf/btf.c falls back to using the
> vmlinux_btf.
>
> This fallback causes type ID mismatches during btf_check_all_metas() beca=
use
> the module's .BTF was built with distilled IDs, ultimately resulting in t=
he
> module's BTF being rejected entirely.
>
> Could we add --keep-section .BTF.base here as well to ensure distilled BT=
F
> validation succeeds?

You're right. .BTF.base should also be preserved. I'll update it.

--=20
Regards
Yafang

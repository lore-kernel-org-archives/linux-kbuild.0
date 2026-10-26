Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793053538;
	b=zCvuccMQ/IwqbLePRlX+2O2LYGGwzc7ZPHS1HlTPA+4JlLCUZlO1Myc2bU4ppbtsEYY4
	 b5QTxLMXWtAA9C0UPdM6m7qgtLyCTy9syqX1RetkhvhiVgYYMu4Uca2TQ2CC+YXrnnMQJ
	 JO0e2geyj+sDYZGO3z90/Zf1sE2LGWm9lx08IyUeMKFY+TAFRyVA7CLMPipBq41ug33v6
	 /qJc0lcLKhWx3nF2vejRIQKSw3whc+oVT2S2vD33yq7EIs0gFZdKmealrg3DxPnH7FG7J
	 nFsTkTocjhh6ZvwX8FcrI/SMXnwDiPTZA1Ze2CFDqZWnWExYAbIhxemr4fpt8yURUew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cGAzUHcm0sGgQA1n2QKAQBWci/eVii3nOBq4rFQatG4=;
	b=0/C3T6vWiHqeO+LwLF/lrXzlAwbf+YFFIYgMf4cRPLfnMUme584C7D38dJmi7+77B9yg
	 aIUPVPrycmw6PPIcIhtfNZ1xcOqe0rTjl1UvfoNkJQmqa5SRQj/saDzDTVZC8jyNsJR6S
	 PRDfhZjlC3KfcckKvZs6LvXlciiuHPL3o/mHvA0WK8v0fsAns67MfLrV29hMWKghVnNjy
	 QODu3i8DQPvMnkQdhJGr9gD4Iq8rGIMzGyhvjQs3RsUghCZmDdfkXaNZ1iszgm/B6tI/N
	 nk4/i+H1z5Aax/AeigowxDNn6lQq5kEaZxprc5+RTlZK2aCDkh8j4iZZ8SnjhyozhTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WBXXhweS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9014606A31D
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2026 22:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9014606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WBXXhweS
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-679a2297c55so4268996d50.1
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2026 15:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793053537; cv=none;
        d=google.com; s=arc-20260327;
        b=cBkkKCLnsB4kT/5kt45g1QntJFqHQM+S1p+sI4J8cflaWr2otTnNEmuXES2VxCb6RY
         /ZLhA7cL+IZx/6kbb5Rg3WH/JtIROwPVHr+6WOjKcq5YVZTNBzs03KkcDNYCcaC3UGRq
         M44LW/kcP+mwmWuSseQ7P/dDN4uf/Tr6M8a+IphjatCku0AF2hU/JtfM+hj4a9dn8NQK
         HFm7UWwKQ835Xv903GuTKhdt4ly10qXzWhAE1lB0PStqUiZCZ1Jb2B/UVYV+vYbaOH01
         XqUGAssmQhqyPk43mRGEUa5yygtCUMn+HhSfP0CDKMRAkgvg2MQvK82ptEuu7IUmkpFJ
         oQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cGAzUHcm0sGgQA1n2QKAQBWci/eVii3nOBq4rFQatG4=;
        fh=BCK8Iuy+gDG8m88ZwFdpzaESYuU99GpoHj84KFb9u8A=;
        b=dyg7ta6kaIDmgIz4cP0VnPnHvxo20RJvopEPdk7r3llMQosl44ZTiLt3NAiHKGhaDN
         Db+8xFMvDCaAGzV/TP19oUGYFDhXo5oxB2tOxBH2gMbcfZKkaYk1LUQdPctZ3Q4q6XfU
         FYQ4Vfh7/DSqStfiX/H4ES9KnoVXb6jN54NoOZhaAnKz7pTvuNxY8fqL56T/t9/rFiU9
         J6oRRkjtPEoHIPWLZFaZHc2CtHwXTVfQN+1gFu6VEHnAzhTN4Pb6+YIUOAiOMlXv0zcs
         oLxAHKRECYFRqcmQ/cXPd0PZPN9OHMCq1au4mlI8KIgSMaiZtUoLtAYNQI899KYR5kyE
         h+sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793053537; x=1793658337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGAzUHcm0sGgQA1n2QKAQBWci/eVii3nOBq4rFQatG4=;
        b=WBXXhweSPlHVgMKR46msy9DuFxjt4NkW3RbN8qAJ8/bRtsErIsRfs8F582jzOM4OyM
         RCX7EiVyrNJckcqsfBGnjUuxMAMi/VoGOiNUi886TrRjKiLkn1Lu1GwVm+vGMLPNUcP9
         UPAKYeFhIGXO2dgUfLcdBCkeWtPKirGHRp/UfBB2FvU6A5QCBSdzceOMfP02pKqJgo6/
         Kz0V88vnDaGuHlYcSPFxW+gq8AxSEZgoix18RLsfTmUzN/hJg22Daqn5lWipjjA3o0QJ
         1+6v6LY7Zz16zGCfiK6iRGuX/Aho9eNt/Sk9AgWNwH98LL3TLxp+3qDyeyKpP89OJk37
         WHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793053537; x=1793658337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGAzUHcm0sGgQA1n2QKAQBWci/eVii3nOBq4rFQatG4=;
        b=q5b33x76WHT+dFUKVduZU7HEG9+Sq1Oar/dBsM1S3vw7ZXHN/KGACGwqM5U6KSkh92
         C1KeuQGRWgAhi8nokZyawmsEp3sRt4AxhJQme7TG3+rUX8g6v1HU39TAGtTugalWfktu
         /O5epToll3TwiQOaimm98Lj6SgyYzVE0uPIT8fcxNt/5EW3noaHLPwq3ewKNsrB8AYVu
         xUWlY4UVlN3JMVKumq8LZj9gz+YzJtDBTigZOmwpKMcwNZ/r2PD20M3tunltq1tULr9w
         eVbsSDtt3ky7tDZSaB4AsqyE7d0CKPLAO1U29O/4L0hYFgAUFtx556ThP2bSH9OV16Sa
         uI+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzrA+c7f+wY+1ixwpJz+P7ktU0dodkke7bidJmva7R4sJMu1BksBN3/qAlZ+PDFAJh1Y7L8RNgTw76XEK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYII21Hqtjb5SvWAVwgPHaSR1WpK0fRpaCwwSe4aiLfPLQlZbqZj
	nVM5HqTalE6foTF9ur47x0QShgSWcA8+bNrMogJXgRxYsxLQkpjXD8DM4bBe4yXabZkrXxz1VVv
	MRTAyNR/VkA8we2awuzlPMLyR7ouaQN8=
X-Gm-Gg: AYBFou34iRgt+pJDWgox3vdfVvu2MtMaYKeg6+hHh+Toi+AjE5bgvzibzEnwClfPSyA
	deWa0PLS5joxxZkYdwfF+MuTWIGarF4ltRZ8l9UA9XwtKziKnxhIw9lxSGcSGUe3SYorp1ap0qj
	/zpq6bhaNXowCbzPq8T8J2ALh2JmMjiD+nIbVYX+4kcTx94Fo/jVvckfNcrr+bgkyLz2TiZzeTx
	fxvcP0UYKBX3tkvZJBkDStbDxOlnJZp4orFi8xpd/JAwIPyBngproteXgUlA+gtV51w0orpSxLp
	2sOIahXmpB+vZyp2uRySRxFx6LD6Ul4wDxNDOeGgttEU09LMVNN/zoP+dgwSu81OCMLzaHpDPTt
	YqXBtOPZuS3qu6HmG9+ab7Hgxl7hxXIwE3+vd4c+Mu5H8F+hQO457ZizW4J8Xq7r5jEzAdthH2+
	F4fzkd1Vfwan5yIWqT4Sd3Z6brxB3wKqjzC3PJ
X-Received: by 2002:a05:690e:12c6:b0:679:ac3:9752 with SMTP id
 956f58d0204a3-67a4519489cmr5899753d50.13.1793053536512; Mon, 26 Oct 2026
 15:25:36 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
 <20261012-dd-cmap-part2-clean-v12-32-3c8cc5725def@gmail.com> <sashiko-outbox-170731@kernel.org>
In-Reply-To: <sashiko-outbox-170731@kernel.org>
From: jim.cromie@gmail.com
Date: Mon, 26 Oct 2026 16:25:09 -0600
X-Gm-Features: AclHuK8oPmCxBxu3r6O0jmjf6VGp1ZvogtAuE50408WWPep9paf2BtUZbw8FvSg
Message-ID: <CAJfuBxysCwTo9PZpgvjz+=ciTAAmJtOBAbE55_D_yhk+XuvCFw@mail.gmail.com>
Subject: Re: [PATCH v12 32/40] docs/dyndbg: add classmap info to howto
To: sashiko-reviews@lists.linux.dev
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:37=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] docs/dyndbg: incorrect signature for DYNAMIC_DEBUG_CLASSMAP_PARAM
> - [Low] docs/dyndbg: commit message count mismatch for API macros
> --
>
> commit 28be193f6b722396acbf0216c1b36e74ba099d0b
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> docs/dyndbg: add classmap info to howto
>
> Describes the dynamic debug classmaps API and macro usage in the howto
> documentation.
>
> > Describe the 3 API macros providing dynamic_debug's classmaps
> >
> > DYNAMIC_DEBUG_CLASSMAP_DEFINE - create & export a classmap
> > DYNAMIC_DEBUG_CLASSMAP_USE    - refer to exported map
> > DYNAMIC_DEBUG_CLASSMAP_PARAM  - bind control param to the classmap
> > DYNAMIC_DEBUG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug
>
> [Severity: Low]
> This isn't a bug, but the commit message states it will describe 3 API ma=
cros
> while actually listing and describing 4 of them. Should this count be upd=
ated
> to match the list?
>
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docume=
ntation/admin-guide/dynamic-debug-howto.rst
> > index a8962ab22aaf0..f5b1470a4b881 100644
> > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> [ ... ]
> > +Dynamic Debug Classmap API
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_DEFINE(clname,type,_base,classnames) - this map=
s
> > +classnames (a list of strings) onto class-ids consecutively, starting
> > +at _base.
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_USE(clname) & _USE_(clname,_base) - modules
> > +call this to refer to the var _DEFINEd elsewhere (and exported).
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_PARAM(clname) - creates the sysfs/kparam,
> > +maps/exposes bits 0..N as class-names.
>
> [Severity: Low]
> Does DYNAMIC_DEBUG_CLASSMAP_PARAM only take one argument here?
>
> The kernel macro defined in include/linux/dynamic_debug.h requires three
> arguments: _name, _var, and _flags. Could this discrepancy mislead develo=
pers
> attempting to use the API?
>

fixed in v13

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-dd-cmap-=
part2-clean-v12-0-3c8cc5725def@gmail.com?part=3D32

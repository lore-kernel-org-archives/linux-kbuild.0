Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793060805;
	b=fF1Z5gcPVZhCW43Mo8NxzPTjeA/z7Gh+kofDE0eplrcx3wX2FbHvljczFtD/m/5OObcA
	 Xn8ZELmtu8PS0Ch0v2n42ImeM+Hpgx5yvRwr4nwejBdn3Moa9RuHiVLFPeaiyBuf+22xJ
	 aAsO5HCvZ4NnVH+LhnmHNlkBcGtIY82mr7dmUgtXTn7SfSqiOHWFWovxBw8TnJJGe4JFF
	 dOLHPeYZ7G0k8DKgz0FLgtwSVCEp0TbQTkRNHW0+G4H5StZ6BdWXPDFM7mpVOWuZBMS3W
	 u9CsGAU1aZa37618eodmtiLtMMplXtPoCrYnbYYyhRqSdzSNGNOWqZ0gL7Z6vTHpi8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eybqDydWM/qmE6WTUncvgQt2QyS6Zq7ps/uXBzvWlWc=;
	b=Ao6U8L5FcgS7NRJKFMOkrNc5N5n7ZF5ij2xH0AgIrSuqbmy1dDxsSs0XA3pVFaeuQ+t+
	 PRX2O6ZKk9lw+N7ARBqGOovVWCDM+xZ2LyFMQ+3huB1EuyKCKOAhSl+GpKKHUNGLpRXep
	 N4Q1ElHVpLyTSQsB+kYYmGCyY6oPEJOizHnCsMvZ8cTsxSFe+477ZB4kYYUMiWWzzbLeJ
	 AJIiOkBiO6C1UJ0icLuwmAj60kdww0LREoP3nwWJ/+1W8tZ07BfjTCMAwIj0SPqu+YDt+
	 fBUD6YkRB8smD9NEYxY70rnJlFEM0T0YNGpcubStEqohF80GjQ8D+cm0mrYFB5rsJsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QM9gFSMu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D244606A31D
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2026 00:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D244606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QM9gFSMu
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67921b515a7so3506800d50.2
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2026 17:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793060804; cv=none;
        d=google.com; s=arc-20260327;
        b=dAWqwv52cqcx9p27S3cGuXsqA58QqFN55BhJ7LlCfBeBP3lIW834N3LKE9jfr+zxQd
         pvPlY2wskM2TnGnO5jakrV7sm7pXFCVFyEHug7Flzx/+M6jwl6x+hl88IU4dJxaQzfcD
         Y4bCTyiNLPMsoBuQUj0y5d7O3qKkJa5cZPsTmiZgazsqNFHeBAFcz3kRNw85g0lP6pPV
         OAVOaSsY0HwkUbxQAsAyM1igSt26ZwapNhOnkZrv9zQYTpCUCsGg5f9rVo72HUmRZfUE
         mmelvIaMt7XNUuYKfwgyzNC+7aXmbaSoImeLNhxamX9CfBKlXQafpxvvYO3XhWSjToWd
         Z/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eybqDydWM/qmE6WTUncvgQt2QyS6Zq7ps/uXBzvWlWc=;
        fh=FSXErWPysjDNeTZxx4liTyzsigXKaWZBmHoV4mcywmc=;
        b=Pdfah9bkRnKO6/1zgGgrRKzLQ2qlp+wC56octYSHFhSfWZuC/LM0kf0YjF+fxBxwA6
         d2R5E+YzHWLyZ/O8SC4cNKKPz2Kye0YHPxNIz9Nq8cNsEpikB3Sc3QjZDoOYaAe4OHE5
         9VHpPXmMULwEZi5xCx5mX3uZGsNDU/OqW8beu6BySjEx8JxFlqzgh+IHvMUPq8tFA3d9
         f5izWUYX9tJvXNUikpV3G1lpsIZ+F3oMuh1voes/w84V+GjxIC5HYmHOq1I2cROVmz72
         lJdEY0CAAx4qN+XhXkaGYpvcqf246d4RpPF/sFwSNQhuQNCElwgyWvVzgVAren62P6xj
         C6JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060804; x=1793665604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eybqDydWM/qmE6WTUncvgQt2QyS6Zq7ps/uXBzvWlWc=;
        b=QM9gFSMuY14PSarLpBthEE5PSTtYJ5iQwfgHQXQxXdgyxSiGBeDMvvVy2F16VP31j3
         ZaD0gTSPQ7tBhZ8ywZEs4Mm32UcUHxBy8wqngXv0QxgVX4bM5zngRoe9iRD86veEOOAa
         AIQ4D2vzgjQ7WStKg+WIRR7tSxPvc4jva8g1Yn2WwYrlnrKElf+xegqOTHz7oitichVP
         dnws6dF3IsUeHfMvlUNqB7rY7WfWfR9B958oJT0/dYdusZ4FBwZLq19JmVbiO9PglY1J
         mtt7Cszp0e/J70gkbUSLxEG2XPWXTagQQgdGm5KtjXRmuQR1c/V8ld1q7G07yquEPoCy
         GREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060804; x=1793665604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eybqDydWM/qmE6WTUncvgQt2QyS6Zq7ps/uXBzvWlWc=;
        b=HdbhEPduNOOVp+G//QPMGc71G3sua9bTNd7WJZsFfWbHkESjti/Onx5fbn/1izhK+1
         GUuKhjaO8+xqjzWROwEPqbicQI5FtH7jslkXN34MzyJe2QnYPb78OOLPDupKXaN9Amrs
         Sg5VQLdM1NKO9gjh/pUNdZB6X7L6CIYaalZYuDTF6z2kpYWYcbCqilB/r7BEriCAiiIS
         +3iAF6RP/+ipox1mfFwopI4j5Nv123nxo28fhPE6p0eEpaBrBzJoxxN4tttXI5o8YHQw
         5BIoeiaCJyQwy7+TlTpoMdeXFeNDhssI/TrPbmW0x5ldiR1/axm6+l0KKFKxPfuQNRZJ
         q4nQ==
X-Forwarded-Encrypted: i=1; AKwUvBxodv13CArPeugIJV+HWrr1SdoletOqT0GK0ycn78Nwpm4/lZ2e+KVrNiOihBsWulM8wKThG4asBiPLTJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYINMkqfYzOww9MBW/IwanCeCyKC+jtnYYPtsdx+OhGTUp43w2Vz
	nCBtlHSSIPuqaqIxqI5EZ83+mfOvXZe0kXSEVPqAFcQju4DDIkUgQB+/p1ViftzeZ8hik7AK4it
	TAB4WidqINbCceM7HpBdNaw7wGwmN0PylTY9r
X-Gm-Gg: AYBFou304ba6l0G30Fxspk+SDc2XOyOugUvv9/Yo+zAWbc6C6IPHy/08xJP08hLeq/q
	/k1XnoZuwLBJxjoPGQXYSkKZKONffSLFchTR6YK4MoVYohXrA8WU+3Zyf66ITPUiHrt2UD4nlxv
	Z5dGZGxDRh9fOrjWvpVlwY2clDccy4HoIruG3X1LBnl6BvgrwJWGLGS2Ewr8gQAxdAJm+GQUEUO
	QcZbdoWCK8tnwH037o29GVTe8rJjZ2MxyahV0b3TRPIdA75o+As4UPY5ysgDttSggrjER7BPoD+
	AiW/vGv6Zr79UhPtDaZg57yNic+cVxrYV42s/QedHtIkXTrufXcsixLZgGIvxgFOqSqc6MaEm9I
	uR0hfhLEmL3GF0vfB7c+54IiNt2O0MWFotHwc8zNdyp5Bq/ih1S24fyKE2svZKrCRol1CQ55hMk
	zTyjEeLZD7fBs+Iio=
X-Received: by 2002:a05:690e:450e:10b0:677:ca67:98f4 with SMTP id
 956f58d0204a3-67a453de253mr3907194d50.45.1793060804234; Mon, 26 Oct 2026
 17:26:44 -0700 (PDT)
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
 <20261012-dd-cmap-part2-clean-v12-10-3c8cc5725def@gmail.com> <sashiko-outbox-170703@kernel.org>
In-Reply-To: <sashiko-outbox-170703@kernel.org>
From: jim.cromie@gmail.com
Date: Mon, 26 Oct 2026 18:26:18 -0600
X-Gm-Features: AclHuK_jv-lTnu6VYS2062o39f_E507yFRpnLLpthRIG1YaVwpNMuyVZmZdMW28
Message-ID: <CAJfuBxwNEG2ukJbPyVqdu0jKN4_CGh_ZR1pYj1z6AJTErfLakg@mail.gmail.com>
Subject: Re: [PATCH v12 10/40] dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES
 and code
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

On Tue, Oct 13, 2026 at 8:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] dyndbg: documentation references future struct _ddebug_class_map
> --
>
> commit 4edbf52dcd2e7bd06805f06e89c8d2ce8672c81b
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
>
> This commit removes the unused DD_CLASS_TYPE_DISJOINT_NAMES and
> DD_CLASS_TYPE_LEVEL_NAMES classmap types and their corresponding code.
> It also renames enum class_map_type to enum ddebug_class_map_type.
>
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index a10adac8e8f00..9607121c3072e 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
>
> [ ... ]
>
> > @@ -119,8 +109,8 @@ struct ddebug_class_param {
> >
> >  /**
> >   * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
> > - * @_var:   a struct ddebug_class_map, passed to module_param_cb
> > - * @_type:  enum class_map_type, chooses bits/verbose, numeric/symboli=
c
> > + * @_var:   a struct _ddebug_class_map, passed to module_param_cb
>
> [Severity: Low]
> This isn't a bug, but does this documentation reference a struct that doe=
sn't
> exist yet?
>
> The comment here refers to struct _ddebug_class_map (with an underscore),
> but the macro DECLARE_DYNDBG_CLASSMAP currently instantiates struct
> ddebug_class_map. Is it intentional to document the future name before th=
e
> actual struct rename occurs in a later patch?

yes, intentional.
using future-name avoids having to fix it later.


>
> > + * @_maptype: enum ddebug_class_map_type, chooses bits/verbose
> >   * @_base:  offset of 1st class-name. splits .class_id space
> >   * @classes: class-names used to control class'd prdbgs
> >   */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-dd-cmap-=
part2-clean-v12-0-3c8cc5725def@gmail.com?part=3D10

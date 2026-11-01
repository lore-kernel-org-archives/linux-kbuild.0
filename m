Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793568071;
	b=40m29wCCe7FAQR1RgYDzwJhZD7BTy7ls3/YnLJXubXJm4dC3dr63q7AT058sOJyaHoGj
	 +3jiG/MgWqJoloVb/3iqW0LFOEdgJCZpDH30jhwkrNVUMyR1X4MgIV/GKuLKv/lL3P1ll
	 1bn/ikkVQN9rQY7DnOBiJVKhKyXgSwtyxZC8pCFEGaHXapoyCJcgoe0oLV0XXTmixF3IX
	 pR07ti5B5EecLTPD/gzhQIS3qNX/pOqLP3Cj0qpoW5fQ5LR0Fv+9XaDKDZgVRpb7yxMwK
	 otsMlufq944F5CPvKf2WexZWBG8mA2AvXVeaHHjMDGdqlok2YqGcUCGiQ4F3Jl95aaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793568071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
	b=UVQm/0NmQsLs48j/fL7ttZftvbNGR/siDx/WtFkV2tQqjzWWgzTSi75MiKYN2tabJOWa
	 y4ByyrhoquzUvSsXrwuvvXQojC7jkyaVE2UU4xnfqMcdQYmTTC/W/GpWWwjlsCF9ZQAe4
	 tyVNdBlE4VqSfiJmfmut2qmuwDOEUz7gRt/Id95prfWmNCx//V1EBMZwS8Nw/DKEyl26o
	 87xZCzlgry5V2ugqJU0fZoDtgBd4WFQ/xHSKAlJsq4vBQvaB8hSlmSRtwgRD6JaXJRbXn
	 o5Af4elgBGQJd0bqT7zroMihZ6OVD/sShZZMWrXvtXHSSVK8kIUFucZMTc3vmBHGCww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QJu6vw0Y;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057F0606A32C
	for <linux-kbuild@vger.kernel.org>; Sun,  1 Nov 2026 21:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 057F0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QJu6vw0Y
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c169ae1cb26so547887866b.1
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Nov 2026 13:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793568069; x=1794172869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
        b=QJu6vw0YecVPC/yqtrBOLGZGHytMf4YITHelib3e72cEizM25ecWwgGReOj3W5BJhq
         917R0rBmHq8sQG1dbNAV63WM/BwABYDwDu4qnn+sYOEjjzeJsFHSG0p4JX4xYnhNR7jE
         sPWfZexDU/Cers/8tAVsPO5Gxn+oQdCww5FBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793568069; x=1794172869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
        b=ulxTN6ucoG1rRO5Deqa+09gvGjcBzIn0uJLmtiq8vmg+YdbovA0xv/6/Ojybo6UinL
         BH2HOqmV7Cl4fqP6bKx6ZWfu/6P+IqpxYVZNYI2NuiM404qPl1jm4uKBo3fTiMlJPVDR
         VMapNCHA7b2ujUlVjtKTKl0L0xJFfm4Vz2tR/4P4ymy9l0XQSPMLw7M1i94aYJ9ZkMzx
         5PqMskKMK39mo9HzN5uTFta2bBCH9bv7nIUgUqvPSqVOOlCCuJPp4Mj9v2iGTWdTOdJk
         158HrYXQjSxJlgLcRUoKSMin0UZczGl9vaUJ+hIwXGbfRbHVwIXXKRFCWzBWN928x1mv
         Rjew==
X-Forwarded-Encrypted: i=1; AKwUvByQRr6qoTu2/ah3ApfEqTLNZGv02bEIK8rsadzIEfMgfubUIGqwtxulcajbjt+kdy5Ae8zgvEfrsBvRGGw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjNpS+MjLrANzgdlPguIS2SpMgLf5yCWXnG4CqwWBMmTjxKX2W
	RqBnkDhEu5kEL0zAryHlVFGddtMGGAGxnGOoci5XmQxdelga/4s4FWxVaZIF+EEmS1LmHWn697e
	u3+8=
X-Gm-Gg: AYBFou0adqPpYkR8x5zCWeEzEkETs7Jf+CteCV5/TdoaEeX516JZgBAysMZ6pVdnahb
	j3J8vSgOtFiRpFIh8kvaY+CDMZKU6KqqRxyTFij5iufVMM2zDBbvMyws9UuUBA9ZPU/Cv0UFHJh
	dA4z5OiNjl91R7B3VLZ3RMGS6D07nLHFPgFhX80KDp8ksjP1lU9QmX82z69DYdLyeulR/T2pcUD
	XjdoJUlcENprNOxzQqNbCsyZYj5T2Y0fgzXsfVdAprOVKHYcXr31EiTIIvbxp6KqZi3zU2GYc3g
	hzZDwO0Hn+RL1Xfe19W8QZQoxAnHSyu6/yNaYDuffb1IKLi8BELY8mzVodzQcAhlUWD4ezPVo1y
	jbv797hW498rpRwRpn8IKVLyxyIWoWLgOZ4sa5Ry9I1t+fKqjLvo2sz5jabv121xbu+w1ZQsYat
	ebNoX5UuGLcuQ/V74ZL5dOGkQ1JN11/ER11FYR7E26VTf1ksrighIja5lxKL4k40vZka5EgRtjf
	AQr1KDBgTydmTZJzgAzUEhTCCHW8sf7M7fqEUUXWS9XLpPPeNfRCUzC3gE4aZ8+PVj1XK7KISxd
	7e97MBZER+j1ZKhCxssPJGWLFh3/a36QPzXmW7iwgIDLKd2LA+UqV34wHAZ0Ikkzhqac
X-Received: by 2002:a17:906:eb41:b0:c4c:9abd:7373 with SMTP id a640c23a62f3a-c4c9abd76abmr511457666b.33.1793568069417;
        Sun, 01 Nov 2026 13:21:09 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f504sm310900066b.36.2026.11.01.13.21.05
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 13:21:07 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1254777f8f.0
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Nov 2026 13:21:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxqhvggidYtT9Ry/XGLVHXh1zzEnvsqU7LNHUovtOuLp0hhMTPe0ImLrdqNNWPJ+zDZSrpydLUFWxHfyIE=@vger.kernel.org
X-Received: by 2002:a5d:64c9:0:b0:48c:585b:8825 with SMTP id
 ffacd0b85a97d-48e6e2db4a1mr23331343f8f.18.1793568064814; Sun, 01 Nov 2026
 13:21:04 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
 <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com> <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
In-Reply-To: <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 13:20:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
X-Gm-Features: AclHuK8iDQf3Hi4FgB3rVtlO2TSTt5l2todvm4T0h7_4dZ5xTXqg7HY4PS9Cbco
Message-ID: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 1, 2026 at 12:55=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> Doug Anderson <dianders@chromium.org> wrote:
> > I think that was in the the "after the cut" part, where I said:
> >
> > You can see the fdtfactor post at:
> >  http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.or=
g
>
> OK, that covers where the tool comes from, and the question goes away
> once fdtfactor is imported. Text below the cut doesn't reach the git
> log, though, so a sentence or two in the commit message on why this is
> wanted would still help.

Sounds good. I'll plan this for v2.



> > The goal was to make sure that we could fully reconstruct
> > __local_fixups__ after applying the overlay to the base. v2 of the
> > fdtfactor series handled this more properly, and I'm planning to see
> > this through and land it unless there are major objections.
> >
> > By default here, I'm running fdtfactor with "-S" to strip the
> > __local_fixups__ out with the assumption that today people don't
> > really need them. However, someone could easily override that locally.
> >
> > I'm a little unclear how things would silently produce a bad overlay, t=
hough.
>
> Sorry, I should have been clearer. This is about overlays which kbuild
> applies at build time, not runtime ones like Beaglebone capes. An
> entry such as:
>
>     lemans-evk-camera-dtbs :=3D lemans-evk.dtb lemans-evk-camera.dtbo
>
> is merged by fdtoverlay into a plain lemans-evk-camera.dtb, which the
> make_fit.py path then puts in the FIT like any other DTB. There are
> several hundred of these on arm64.
>
> My concern is the input to fdtfactor, not its output. In the in-tree
> libfdt, fdt_overlay_apply() uses the .dtbo's __local_fixups__ and
> __fixups__ to resolve its phandles, then overlay_merge() copies only
> the __overlay__ contents into the base. Only __symbols__ is merged, so
> the __local_fixups__ in lemans-evk-camera.dtb cover just the
> lemans-evk.dtb part. Cells from the .dtso such as:
>
>     avdd-supply =3D <&vreg_cam1_1p8>;
>     remote-endpoint =3D <&imx577_ep1>;
>
> end up as plain numbers, with nothing marking them as phandles. If
> fdtfactor needs to renumber them, or puts those nodes in a per-board
> overlay, it cannot tell they are phandles, so the overlay applies
> cleanly but the links are wrong. Stripping the fixups from the output
> with -S doesn't change that, since the information is already gone
> from the input.
>
> Does v2 make fdt_overlay_apply() keep the overlay's __local_fixups__?
> If so, composite DTBs would be fine once that is synced into
> scripts/dtc, and my concern goes away. If not, one option is for
> FIT_FACTOR_DTBS to imply FIT_DECOMPOSE_DTBS, so that make_fit.py puts
> the original .dtb and .dtbo files in the FIT separately and the .dtbo
> keeps its own fixups. Leaving composite DTBs out would be a simpler
> fallback. What do you think?

I think your concern just goes away. ;-) The fdtfactor v2 series (and
soon to be sent v3 series) includes a bunch of patches to the overlay
code, and this code produces a fully valid __local_fixups__ in the
final dtb after an overlay is merged in (assuming the original dtb
already had a valid __local_fixups__).

The idea is that fdtfactor and the overlay fixes will all land in the
upstream dtc project. Then as part of this series we will bring both
in, so we should be all good.

-Doug

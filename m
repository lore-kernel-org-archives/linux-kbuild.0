Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793566500;
	b=qF8fe/RiKjzBM+6L+Vk6jaNDJJ4/fEsAc/lyRgBVxXcgE0+3bRUSndt5+2gsOBHGHcYW
	 VY9WvLjD+bg754hD1o9p0i75KARiigH7xUjMOBNpmN0EDfnjbwBOFL1DP0iPay/uucHOx
	 DRTwxjcX4wQZJbYQZWUSIAMy795SAlZ+K4ziYPsDedIalPlONasYN2WjJOATUJyiPQUbA
	 Kp+ECgXyTvRM/U0u7FywyR+MecFeTXC0YXuVctEI0khQ2+kgSVZ3XUN1W0lcCSTaUiLH8
	 ufULS7VJc1JerVG9XwaCTRvuspZD6dMppu17WxIVzh71AQXYdjii0bmgvm6eS4Qorkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793566500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:from:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
	b=1vuMD4knq3H8bZb3w3lnjTNNe4P76ITibU8KVfCod5kflSqsy01MJ8Vj4/xw3pW5aF5u
	 ft/lOEahO8TQ+HTcIObf41FVXL6V5hoDNZbK3VYHVXmlP5yPxT3PhVKpu7k1DuGR+epIZ
	 4zChCgmlUSyrUNkKx4ML6ymPXnSzSJz933yJz1BO269e1Bdf/OZZ8Iu7KilFX33t8i5p3
	 XbM2bFdTmR173I5q7BKsEJ0xVjV0o7oqe2J2D49+e1ddoPVpAr9qm5Sld2hInk6jRxcMp
	 pLrmsLg0t2VY5dRT2NvPtYWm447dBCEF8uyuYT++zJAY5IOsSTbd5w1C+004stWCD2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OxB94iZp;
	arc=fail smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6D5606A324
	for <linux-kbuild@vger.kernel.org>; Sun,  1 Nov 2026 20:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B6D5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OxB94iZp
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so3818100a12.2
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Nov 2026 12:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793566499; cv=none;
        d=google.com; s=arc-20260327;
        b=ldjM1Ctz94NeYEkwXZIwLo9/Po3W0ImYuTLcElsjSyGX8o3vAqH2UPuSQ3X0gw7cit
         SAWp79dPOGp4XTKoUlguvrxYtlxIKH5dqJW7QxtRyKI5r3bbH06FQcOk05UgIldaWSb1
         I6MvScY1V7D7ZcDyS5ie5EGAvbOPyw5/a4OLhnqk2RFOBBywlrGsnIjnY2M3TsPQXXRi
         3qUr3GPIEjE+56Ip7Rb8m71cZOxIjozuNXAdnMRXPmdl9cHLYlKvZvDR2b2rN9uyE+9K
         RULO2ewz6Ev2I9H7vHGxMBDmGglT3AeT24RLNQ8miO+hqOy2gIygstUI6hgjOvC9fSaa
         aT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        fh=gKFEMSPEGdTucaOILLHCHe+9D5xzBM3XKg9s7uuT+Xc=;
        b=hoI1slLT1Ur5i4Bpzd+sF35okyfsNpyIKS3j5Im8jVvYGr3BXX3uiQTQ/w6eFA5U0F
         N+VglNPtTAEHHRkj/h8l0hs6S1SrojWk5UNrz/cPnq2KV24k2UdJB7kGIhG5ic2ltFpJ
         imqCZYmYcSDgJ5vFUCf+MY4szsKyGDB4sF3Nxfu5YAbCmZe692k/ca2FL0inL08V5r3Q
         724bkTQvTDcBLLGopgIHG4EcHA84mylL3mnmw8DCfXDMYnDRNsj2y9KOynmwO6NbroK8
         +VirYt+MB8ibfaXcPA4c+B+ZwUj7Qvf0YZNBVDrQPv15uG83AwWe4tnG9RAFhxrTsTXc
         lMyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793566499; x=1794171299; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        b=OxB94iZp8kdfd8GGKl7b92g3lomCornpCWOX5vG+FCefMPIoOtL/O2J/UfZYK5YxrF
         Ivv6cnQUQcyQUIfr8TQDTGMme9b8bQMpK5Q4EOvhLX6eZsOHWv2ctm3ukB5MBhYYPoY5
         4u3OOXQt4eXFHxmaIMUeQ0mJTZaMyYE/c/7qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793566499; x=1794171299;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        b=F2QfEPrjJbLHUNngCyeIzrR8VvFP8OHybvuEqC7rH+YprebiITH4RWnXW4laPj1+0i
         upgw7Q8DRU0ZnPcyHmM3HtAoZznSspdXaJZaS3YX4LO1dSpzP++gOHGQfh0WHdmzyBfM
         gRd5mvGBf/N1gCZryC4/2UEpe7fZm+gsPxky+ru4AsnE43DJP8p0BCDRigc7JkhA9nfJ
         2cbr/TlbGgdcviypmA7QDIUYl/QuT1i2mcSx2o6KKZy9IMZVczk4XPYCBteHQuO0O/3L
         W+Kw8lCUdEr0f9/wJm0xwpkhK4A6l08QgB2rzu1nfBao4Js9OAI8KcOgd42Bc4o5xWv8
         0lOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwuFLbTSPiwl7WM1SEZfLyVzVFMrjB/hETO8txiBXNgAsqoIOVIK6bHAf/Sqa4eOJOn8DZ8AXD9Kk77DM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zf2R8zaialoFgOKPKUPur17eU1xo0bxBTz0/J9U84oVdAQsio
	Yg82YmpICgFA2vSR1aNoxh4Ls5NQegnDNeQBfX9YTpQDGxn2yXk+xLERmG2F2yCqyyaYsgsAIuO
	kqg2xoGbElKUOSQL5VpaAl49FgsTvRFRQH0QGqZJV
X-Gm-Gg: AYBFou3173wEk1jvhrATpy0LXmgGLUFFQiqk5N23KeST8Dx7LHa7fQTwW63x2bwK6SC
	+wU32Oa1kB9A21Jf7BEq3YlHRKMod3GacEFjfubfvg/Pwq4q1ijHnaKxhbjFVMbx9Fv4tYq8FnB
	6UOcW2SbfmhIWycEResoqGWn/1E9gx80bnwYKUrr8v6mYJSDy13JhtYel3I0w8YGNrfJxPygyQD
	u7Yu+vA3862ycYaDDDs1/rbe3j3tFWa8w+O7YV6xJePO7YhNS682VH5b1FaEoBVATyxKlU3CVdk
	z9jD77l4NfXwPvuML9tzEiGhoYp+YyCTGbBvngWXvFXgHGxHsryTNl3ZFhbr0+jAsSA4mJ4Wcp3
	ep8NKThMevpRXr1Qj1oXIVRPwWeLHqLy9s9VTM6Upr5iRnJjFLsQABsLvtqGMscLomkjwFUU=
X-Received: by 2002:aa7:c1cc:0:b0:6b1:bb19:deb3 with SMTP id
 4fb4d7f45d1cf-6b4d4d6f96amr4159175a12.25.1793566498639; Sun, 01 Nov 2026
 12:54:58 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 12:54:57 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 12:54:24 -0800
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com> <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
Date: Sun, 1 Nov 2026 12:54:57 -0800
X-Gm-Features: AclHuK_IoQTHoKBTaMx-KZNiIPIi7_TIlou2gkeHseuy-klQIv193ZXwZZvOcw4
Message-ID: <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Doug Anderson <dianders@chromium.org>
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

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:
> I think that was in the the "after the cut" part, where I said:
>
> You can see the fdtfactor post at:
>  http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

OK, that covers where the tool comes from, and the question goes away
once fdtfactor is imported. Text below the cut doesn't reach the git
log, though, so a sentence or two in the commit message on why this is
wanted would still help.

> The goal was to make sure that we could fully reconstruct
> __local_fixups__ after applying the overlay to the base. v2 of the
> fdtfactor series handled this more properly, and I'm planning to see
> this through and land it unless there are major objections.
>
> By default here, I'm running fdtfactor with "-S" to strip the
> __local_fixups__ out with the assumption that today people don't
> really need them. However, someone could easily override that locally.
>
> I'm a little unclear how things would silently produce a bad overlay, though.

Sorry, I should have been clearer. This is about overlays which kbuild
applies at build time, not runtime ones like Beaglebone capes. An
entry such as:

    lemans-evk-camera-dtbs := lemans-evk.dtb lemans-evk-camera.dtbo

is merged by fdtoverlay into a plain lemans-evk-camera.dtb, which the
make_fit.py path then puts in the FIT like any other DTB. There are
several hundred of these on arm64.

My concern is the input to fdtfactor, not its output. In the in-tree
libfdt, fdt_overlay_apply() uses the .dtbo's __local_fixups__ and
__fixups__ to resolve its phandles, then overlay_merge() copies only
the __overlay__ contents into the base. Only __symbols__ is merged, so
the __local_fixups__ in lemans-evk-camera.dtb cover just the
lemans-evk.dtb part. Cells from the .dtso such as:

    avdd-supply = <&vreg_cam1_1p8>;
    remote-endpoint = <&imx577_ep1>;

end up as plain numbers, with nothing marking them as phandles. If
fdtfactor needs to renumber them, or puts those nodes in a per-board
overlay, it cannot tell they are phandles, so the overlay applies
cleanly but the links are wrong. Stripping the fixups from the output
with -S doesn't change that, since the information is already gone
from the input.

Does v2 make fdt_overlay_apply() keep the overlay's __local_fixups__?
If so, composite DTBs would be fine once that is synced into
scripts/dtc, and my concern goes away. If not, one option is for
FIT_FACTOR_DTBS to imply FIT_DECOMPOSE_DTBS, so that make_fit.py puts
the original .dtb and .dtbo files in the FIT separately and the .dtbo
keeps its own fixups. Leaving composite DTBs out would be a simpler
fallback. What do you think?

Regards,
Simon

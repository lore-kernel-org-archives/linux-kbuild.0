Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829825;
	b=0XG90/Oe+duSXn1mqPZnk3JcmTr5EBPuSqzcwnNhvG8bHdDx8hwH8abgoZgViBEoCW8Q
	 fXYkr+LIXowuNPCu2v69VVHyUmK4MdpxCObfcbE1N6pn7KC3gtic3eCWo1GTrw2F5k4hO
	 KrLG+sbuQS2DhMofqubXxixydKE4IR+qeUwpEg2S7FMdPpYJajdMMqZXDb0Ie0O5wD/qJ
	 X4q1jQrjTUWV55pMCvvkqRs7JFxxUxrWHQ6AfYVIFGvwjl0pm1toUyytSPehSdrUSXoLK
	 2lACB7J5i/22gHEeZi2M1vdV811XGzggHVdNDgqX/cu8Gp3QFEp4hx4ZV8uRqFj6wbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
	b=ZdSr2dNf8eSPjgqaQ0XOFfHmhdOi6TsZ0yPFNEIh/caQzcBI92cwPRZKvgZSNize3Vtc
	 w/zWBiGA1SE+TJ/pWd+NbYpzcsIQ2H2RcPrZhMnNIcBpDd1QgHXpJrBUAkZDNi0s8aL3o
	 QWvpZeci1bOtIgd4eONsKDlARsi+2QkSobNCP5Xvygd7070hlCZuXaYfojwMhalQPPUww
	 MRtWf5NpNVt7RKBGAgRiyy5XJ6gpO9kxCcUPCDtR4E6SGvT4HMNxCauXAMajMEidsjPqc
	 STyWh2G+uYM6QI+zo8jNvKITeSfn2BeWM2CGPjAq8eC1Qhhk1xBxpvBrJoiCjTPFkCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+U+I4vJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468B8606A329
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 08:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 468B8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+U+I4vJ
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso1630894a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 01:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829824; cv=none;
        d=google.com; s=arc-20260327;
        b=E1fvUH9jSTqVpI3fQFL8K8jjL7VfdLGb+c3BMjrcvldRsqWqo4LFO0s43GKY6VhMco
         XOr65EwQQWrAAZNnudcopVqwGPY/PQhEBSqGWbxvRRiNvUaK6ZAW4P4vciGo83Wgee/f
         EgG3CDqfaRforAV/alznLYVz6NUhsNdGto1gRpPlukogGpgwJIAU70DfgVsCeY90oyya
         G2xtTJzcAHOBRynplB9cpwighAo1TptG5qrb7MndHlv6mj0rczN2ctZd/bRnebAEizd7
         Pj1FsId+uM7CHLbriHtQH7x86qy44UbCu1vITtm4IPyN+VAl1XKIj95Z1zR64E8sscpe
         qqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        fh=1YyTNq7mx1dbVxiqu3QIN1aUNDK63qf+xesVwIOcGi0=;
        b=TsnG385VAE1nfJgWrt/B3PvjQ721wy79mzX04sl51egmA3lm8p1vAizJzrESC6Yua8
         EL3GQcQWifWRMLfmILBC0UBKl5TraMPDTLmFPyYoQ5wVQxKi+C3JMWfV310H7l9/QYxy
         quhfdaaVNekENxnE61D7T6JFezhTIRgDKpz/dcdqGhyqoC1s5H1tJI4vZ/A0c5zsQqyO
         3FrCdsRUpyZkCW94LJDbJGY8D767k7pUmRChtGEYGy/nrWJ9RFlN9xRPNt64mgzcpOOR
         FfT13KXGx5zZkgb+hTqZokc/cHTZMiI064sGUJCC1JTNWmBiU2LOW/T7kNTpYlaUnP6M
         E1JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829824; x=1793434624; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        b=W+U+I4vJebkEFb5QNBPTCYwC9ApUfixleuac2ENZaWXkwOuFj6DuA3cnaW3c8yPds0
         tHi/WvTYjGDVefxbMVw1K5IsCkrCxG4VepnxhsGx9ZqGiq0iU8X6iCkgER//dJugJW3r
         0D51CHQEWQQOefESyNTnu/XmmwlHjQ+dwEs2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829824; x=1793434624;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        b=27OFsFvfja0Ia1bcoAS21i/iNvA5kcdRu2hbHIfU4Z7Kw7LvrWg+K5xFOv/6vIl1FD
         SWEoOFkomqinn/aFGRbK/Nw3gj8b3gAFfgPppkyddnfyxddcRXTjldBonEOG8s0sJY0k
         WrHTXrFAAuT/mJ1g/6V1gshSyiDRlkNL9SasaVcGkbgARCCJKt/2BTrEIur3WPMDwf/6
         uvbTQ87GQ9bLYGLplcQijXqHwsVlnLF6xX1BwOAqIIpwPgyZOdgpJQCBrsg+sxxbBzkm
         Ez1OWphXzqckP4m0c66VUNeD0tTrBOVWR2OImWT3J5056DuP//tq08f6DH8T2ZaYzZiE
         6iHg==
X-Forwarded-Encrypted: i=1; AKwUvBwva9F3J9fWs28waC0Ph6t0+X4RvM1IeayrrWSB0ajyzqSMajFeCPmmxihN/h+xzV7rOesrXZe0EhGgBVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWRtYatVsnRDKEnH9b8k3fa5h2l5xdKY93yLuVAPcENEQaACtb
	0MZ9F40qNwfYrRnCe0iaRaLj8lS0uLN2ZnJ91oj6c/mNi58QxHsDbVP/zPjChn0Xi0Lc80l1KC4
	zUrSirN7/6Qm+g6yavK3hO7uWpwZC6WKV+o+7mUoK
X-Gm-Gg: AYBFou1X5DemvpKKDgolNzsLBkwN/402y7zw3nuZ3R06n/4G3KPcCJckvtKazvPHKGr
	JGwiHOnWDKKrPDz/9fQaxShRNdRElsRxkCNgva8Scm/sLcIpBY1eJZSVNVBbu2dXfOGnObYzLzP
	39tVxAWJewAnlPygXG8ab0IUnhK2UXZLn89libGBwbfNLhUYrIMeaodh+tgGByCRunIszMN1kHY
	9vEokRfy/QCSDKPkLnNfPDbQCrLtcLgnFxJmChdk5cUZ+piibpbWYy7dEqf2eYgmZ/8ou8Frxke
	nKF++CNM53ELUROMRXSA0ZD5vq0JbYj/ZlChvqayyWsC+1qREhqwrdFVbXpG99djjyKUZaQ3LRS
	IAZeVUW3f8K+FSkz3yXufkdvgpPgqzxnYULU=
X-Received: by 2002:a05:6402:1344:b0:6b1:d9fe:88e3 with SMTP id
 4fb4d7f45d1cf-6b442fe4a1dmr1113081a12.25.1792829823688; Sat, 24 Oct 2026
 01:17:03 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:02 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:32 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:02 -0700
X-Gm-Features: AclHuK-hmUOppF09H1eQU74y6c4oDjFc2inDxQbdayDVgWED5bCCmINGnHLl7Qo
Message-ID: <CAFLszTjATXFecK3ryfO=yVY=C9yt9nc52acFZvxfdu5kqGNvZg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] scripts/dtc: Build fdtget and fdtput host tools
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Build fdtget and fdtput host tools
>
> Build `fdtget` and `fdtput` alongside `dtc` and `fdtoverlay` when
> `CONFIG_DTC` is enabled so Kbuild rules can query and update properties
> in compiled device tree / FIT blobs.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/dtc/.gitignore | 2 ++
>  scripts/dtc/Makefile   | 6 ++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

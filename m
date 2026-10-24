Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829818;
	b=EaMB+cxRhj+z196Sq36CoxqwP+rGwCKTrR6Ezq3mhCDhrCLCkpzWIGxkpyPWhY5f4PLN
	 MOlHV1M+EEL9aLmyJ73UQdvwJTgtFlRT/wOK23Hd7ZWz3y/1m07DGNlt8eJ7Yg7mF8Ic1
	 KH1jo/k/LrHLU6BdQ91t72ZFIVaTprzwZHlNtcr1Zjx4oCG5xPOHD+YtgBOtPVAlGu2K5
	 pSUUoAjJjXzdttFEafofIC5EBzk0q6I4JirXeynTAO4BId7HM/QzL+8FN7mKFpkDhhn7f
	 ztcftC9Zof8XT1nPnqtTpeCAPeuEuUJKdgOIAY8qwlZbiVWEoUdby6ZjYsblSD84TgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
	b=DpPKKdI0mBPm5J5inZKFh/raAZ60NQxNuHJIrk03HYrx162131f2hZoVDzVuPJUnktJm
	 z463GFkgz/WeJzeY7cO1kWSQKknvhF3LF/FFKD3jwDXttCorKHgbtJmdFFBJXYny0k0cI
	 XoqQ+wScFhm8uH0ZVolZOJIh86vKHLseI/SepeOkTVB2WTnPohn8m7ewGPJ7Pt4f2nvj0
	 pC7mYz9+Es2qYOoO1J8al53z2A9UZy1AzmxRlPPVmJmMavI0Iv19GRDt2YgOM2wCuoJZ2
	 8QoAGZ3UdR/+7j1uMtXX/VLb9AjZxp2g3cV1dKo1iTLdNITYfvScWx1fwB3ECYxp/0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="j9m/eYvc";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918B1606A326
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 08:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 918B1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j9m/eYvc
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so1815634a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 01:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829817; cv=none;
        d=google.com; s=arc-20260327;
        b=cUc9Ey0COp65EwQcrEXsDiRd43HpLKnUTl3sCHzhINDb1JvozkPcOy1X/gaf73/5Ak
         E8rTS64bwzrV0qafSol1HQ0umDPZGQlSFIJpzU/h7qgqYCDK7zLV0DSDJVnk4p9ob1S/
         aBtOI3hobeh1MUK0NpS1Rj/daivV2jr/uhKYmqylvA4PeuNK5EHJLXC+1onBIhFgNMbY
         D/+7ZxT0L7IomFeAPFwAWGtRUHtryeukJFeKnkfeorfnxhThsWY7Bz5NHhkBCINZAEld
         +VNVWsHUpocYmLOgZqTWDC9QMXsxhi/DvpitLOuISbolewPx+puZWAgVNpnEk6jU+PlG
         atYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        fh=/WTrMo+aJ39h+3RsbCfmzU6kn03xrPT5DOhTWPiuo7M=;
        b=nQQtheiD6WbC25Cq6k9wXEkoAzzm+CYPib8RiQOeMyz2HaADgmrzh2xZl1VTGMzIYf
         sQ/jP5hUUnt/97yCOW8QlhmxhfYZ5Sb4vNFAPYTRQa24XALx63/hlJS2HcrCfoQv3EIb
         GkUOVFZpkU1QvL2bnem9QfE5oZmTXjo+r2A+3yzKobGfpotDnU/lVdgD5ouDW1V7Ay8s
         qHe7loik7sHdSTIG3INufPhatJFkiTAw/8q4yzRF9lJr4jN1ysMFiIDkxhG4NjIZ2l7d
         l7Y38nkegsF8UY937nmwmZuAeEA2/AL8iaIYajUYXtf5YdWkXOsQmZkXtRFxfCG8SNBW
         TM/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829817; x=1793434617; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        b=j9m/eYvcshaqWdxR1RRPRIr1ItYrA1TN4RRH0Tb/73JTmjyGNBA+MSabq/chQ3jRup
         FDO+bPo7UmRdMpdeNPL45rZL+MvdTWsOwUsOK1L3CWBxyBfvgHY1GMnC7+rnUD+uEALq
         OMq+yCYuInNRftXgM4Yo1DFyaRmVERqAUmQ+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829817; x=1793434617;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        b=efQhShGuINbNtaX+DN/9tpjKgsbIOgvWC/1xCtwyx2zYK2CMmqxAFc1WpKFbyp6hhA
         KNQxzIQD2ACLkZ4fRiYwLt5CkkkIwba/ufu/Bp1nZxHsQlGCnvKVeuc2eOD+APVf941t
         61HABTz4Bsb5KqSgE4kIBj8ugKvY5J18vnuZiT/4GbCIjpX97a+9Bcih6Zb3RO8YXSIk
         0EXTuFkXz7Qhm3XwPdxg1LWE2t4+jqKA6yeY+LwtY7mjJeFwTdzjfl/tj8kVP1Pdw3Jx
         cm3YOVdpyglXA6bZd98638nfCWG4tpMSIDGxkuO4IWcbCRogwaJCsO1Xbof0xxBdeqss
         BuxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLjOww5ThdnXC0zd11BqLub62u4nYBAuNApM4TeGWNHkvrxJEYG9sTQNgbSUg3bYOmbG7DuvmSumMcc48=@vger.kernel.org
X-Gm-Message-State: AFq9FYLti6Dqs8+Q505Gn/mCnJIqnryaYzq0EkjSqZMnKkzwvWmU4yJK
	H6dNnmLK36uT0d7SgrDn5miU66JiJjvS02WyG+wkb8W6COuNP/XD9K6yb/7IPsqMqGUqoPqZWDX
	4gcxc2f8Qw517FVWFzafl1Mm5dMh6hvoJadulu8HC
X-Gm-Gg: AYBFou0kyruSfT6u++mAndNRNhfhyYCz+sTdgUMm620tmOZUsg3A6PY0FdCp70yukxG
	wgO7t6rN3lTchqtbUKdsDzG5bMHf7qZUpAAlw5mt3msB6R7ZgprsjThfydN6xFmJ2AzL4jmYvl4
	YwsmAlzx79c1Z7BmEk/L6WC3D6pyLw15XWeqzT+mCn8FA27HLlj2q5fXv5kNjeFVVo3RDfNuc7V
	xckx+3CcELzvq3mkuPUfkJE6NrGWtniSeksSsf/9CCUYCLwBmJICQuPizbgz4lSBKfYTnP8B8zx
	OfhBPbL9adoVK66S7M6/siMty58n6RTFr1qa+9E/srN2r+GmKilyAJFyc39GKZuYV5etZKY9Yo4
	V3GYDJT3BL8qhQq35grFKCcioxtoiBXlVXgQ=
X-Received: by 2002:aa7:c9d4:0:b0:6b1:c355:c7c0 with SMTP id
 4fb4d7f45d1cf-6b442fde26emr1152906a12.26.1792829816963; Sat, 24 Oct 2026
 01:16:56 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:55 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:28 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:55 -0700
X-Gm-Features: AclHuK-X20URHOUw51jVSQxB-TyQaLgWVXdt5sH3O8YNafmV3nonazmm4bHkTWI
Message-ID: <CAFLszTjoZ=TZqW8BTFTot0ZRcv_--BYZgdOCUD-rv6nT479--Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] scripts/dtc: Add fdtget.c and fdtput.c to sync script
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
> scripts/dtc: Add fdtget.c and fdtput.c to sync script
>
> fdtget.c and fdtput.c were imported into scripts/dtc/ in commit
> cd296721a964 ("dtc: import latest upstream dtc") prior to the creation
> of update-dtc-source.sh, and were never added to the sync script.
>
> Add FDTGET_SOURCE and FDTPUT_SOURCE to update-dtc-source.sh so they are
> kept in sync with the rest of scripts/dtc/.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/dtc/update-dtc-source.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

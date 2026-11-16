Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794821305;
	b=Fel+hmHtOnUB6/vFR+jSEIo/i9OrUB6164o8KfENdK0iRbjLm8Ve/RVuI6M9T678010i
	 CSJdSt+piyIrdvHKDmWrv7L/NI1cDOXTzSjfK4VSNmCW48S9jlZAlhV/rWJFHiM0G04xD
	 rEy0Whkn0dFaV2JffyDM6DQftSJptCYXQOdOOz/72nDhimQwbmaPQixRga3vTHycP5kW1
	 CAuff2NP4LlDrxs7fKlYuymdexe3qfPirZlgYiFxkjQRFhkkqjaNFzwJVV695LPze0LIT
	 Wg310uCdbjEIff0lA9UbkDMvovMmP5vXQ3NwNQq6QwSbFiM9XegvGQt15bnaUVPUo4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ck90Ja76i/8lWIveQHIjZjSAi6Th5hdRNv6kbv7cOjM=;
	b=D2Lm6OdqE8sJN9a43gvnqpTPuF6Z4n2m006XlYjdsFhZdJtw108TMJzWFCn1M+qVQUq5
	 X0MR0FNKlQFRrpEM5EJ+Ol8urHhCl9hhCfYZeB1sE2y70ej6abD75ixNWrGS2CtOan+Rh
	 rn4VqAWVLo9sZiH5/ba7jlu7sUjFlQ37AVaPE1Ayq9HZPDQXygsO2AcVdSc9aGvM5xXwG
	 wgsp1UAKd2Z1naweA7+MNnkegXRQ8JH7CfiiKOdTLaAIXxz//HnMZxHiJzcY17EMxS4ke
	 F9NLpQl80L6UtgGn1idnmN2aqGlrBzceQpFf41HSabdcQfKM+BAte/JkTGyT1s+ng/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIlnNq3s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4EF606A323
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2026 09:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D4EF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIlnNq3s
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c09dbe96b1so178577e87.3
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2026 01:28:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794821303; cv=none;
        d=google.com; s=arc-20260327;
        b=AtrXEmYR3Zwk219IOqC3uS82POfp5vk+My14mlr4hzKn6lLwzLK8ozDXshaHVvusQN
         Z+UzNTiGyCwORntXmNEFF2/6zrIcOF0CeurQW7e5E7zlrS8dPYaKut8n3JBSOTzqvUbQ
         IA7lUvEVgV4IjI23inGdGE4qCEL69h3DEvLmf8Wx/Efu7Zcadv5DHsPuOb/mcLV+YCXb
         FYbrfp7vwKmHHZyuVX2IULiwCkS1b34pDlwzKscW4mM+VKkTAtN+H88SvIl2DY6b95IH
         i6PRhlyAcumGzYNEOGS+QgOqiaIL2FS3QPSsPxsDAjgD0vq+kGA8HfmhTu8mOHNeNmlm
         1bbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ck90Ja76i/8lWIveQHIjZjSAi6Th5hdRNv6kbv7cOjM=;
        fh=CwpLcEgZWRKXQGA9OPBHnZEJkg8F42i+MRYuPjuxSHY=;
        b=c27OM6/06sfAQrewzEQHmxgFAaceDImhJLXYsSfzgxdVvIH7OT+z31a7t9oZb+rLEs
         BZcdD2tVj8YCr+MUboMNYGXc0SIXunLECsh120TNbhFeU/uu8KPsypV+mtE0tMOCywRg
         znwygHEeWPoj0WzpxX6ERc99zrTcJecs3uFYhcLXzP8MFKPwl1WpwZgjxlDSNUtuDS5P
         MS4O6qR0BeujSUfh+1MGfDLPdMet1qMLbkxnxnZHErodt+/7ygTijNjO9vy2+2lMdwXl
         kgs7D3qSSqFHL6HM+f1V37M8OYQhgIf+ElC/2DcnlErJkA4mTjSCHKf+J/IxPDr49hl7
         6jTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821303; x=1795426103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ck90Ja76i/8lWIveQHIjZjSAi6Th5hdRNv6kbv7cOjM=;
        b=AIlnNq3sWtmeGAfjFpzBQFpa0xHgKF71/0tJ6OC1UiXLm167IjJ1qN1Sv6o3v5l4dl
         Brk38APQ5UkqTOX+jcBHmmN+M11prghglr708nx3aQvU6P69rmWfoc7EvAWe1M+FJ1Yj
         GAMioZ1Xno0vHQFE/deUYiXuRdjcCBhm0kUmIeR5WW9e9Iz1/hpcfu+Y8naAsd05eQLP
         tPLjTGmO8vB+WmzutBP6n4l4GJIJcVnzLzWRl/9cOMLdXE0YtDjQeXkfRHsOAEZLN8if
         rt/+uhNEQAinHeee2B7+daV4dyMX0h97RFhhSall+MGuDKYLGlv+9Ugh6OHLmfBqTQLe
         Gukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821303; x=1795426103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ck90Ja76i/8lWIveQHIjZjSAi6Th5hdRNv6kbv7cOjM=;
        b=ObEQ6rk5C7PManNzNY4UC78ll4KCMorcIqZ4fAvuJFbmqLhcplYqVhpwPpIUPyBXRT
         2iOyWHz4giMwNeOd6GlHww8R67f7wOJy+qI0zHUhrGUCmfMgcdgfR1fr4acwJRwSVOXM
         ouwLwCDNtAJBVDMI/gzBG+FU6+T/iiou7MT/UKS5VtS64PMcQiKzIQdpnUnHVeji88PJ
         O57U7y5cc0w0vnKz9ywOs8sKwY0uJgz/TtxIec4+jPU2liyyzSZ5QBXi19YkI+v/wx4z
         VxxPxcaCtkVHSlzJ9xABzjhOZhyy8oC9N/Alv9k3mBJMG8KurfxHLEZCfG2tFGoi3hXz
         ZDvQ==
X-Forwarded-Encrypted: i=1; AL+hErEE95SXwBU0Rn5ouRu3P0i81gUPpHiTevqJIET8tyjPKjMofLXv4e9jFZD9zcrFkkhpHMm27iGlMeC0mHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eAjL74lxnH2dA4jl29Hj7rY+eM8VoA8/NyhNceErqwnSBzRYu
	RQ3rYGzgiWjGlesa/eYdYFRp9kVQLooiJD6i03sh7Z6wANTHDX2vR5ADUXdY6Pl5ZgIqRIYUVTf
	iv86IYFRobnIFE4o+ri0TmyRUBmtY98XmtQ==
X-Gm-Gg: AYBFou0f/TwyQIVoS8jS9xmc5ZSr9zahf/gR88qlEVw0xIm5/bMUi0UeAfK4gh21JCV
	LUdr8p9XNQyG0jDCkA72yIekxT/ZcN6cDawDbOsYAoQgZVZXVYEP6NpkeDpjQoef0uryp9N81Gs
	uTBcpR8Hpr8GsXrKMAqjV18m01J9YCAipimeM4xixPNpTC+0+Cr83R02njAGWBV29UUnoS5d5XV
	mGU5PT9ITPOJCSf1z/W33st6VxkpLLGuFPKGlFO8njfxXLsA6mJikWbNpuzT1dw/IyvV+HvZOZx
	GXBpJ4NzdXAZkeIrC2r4UrNKECrSPtsanaIHTBVIq0zMFSR5OpM+CF0oPyKoVZmky3cm8vRS/Zw
	Hsl390u6gyCTd7EvoRRliMS+MU7QMD1dXBs2Dl5ls0eUfoYKfjTgeZ1TcfZc8q+7VlOkhWSOWG1
	PJkA6cqvLl1l5Ci7FY9hc3FhuwMfy6H+VCs4U3tW3aEJskQ3UHrXGR1JnAJrRlLSRG4R+oFHcrY
	/udQMHQI77aBR+VdknirB9rAUCMIJL/xU3tBxyE7kjM1AyZuYiuFBhIfvsDa0I3QgW5vi/BTsc=
X-Received: by 2002:a05:6512:108a:b0:5c0:b5c:4084 with SMTP id
 2adb3069b0e04-5c1705d663fmr4451137e87.1.1794821303323; Mon, 16 Nov 2026
 01:28:23 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avXdJyqNNqopuH2_@ashevche-desk.local> <CANiq72nw+g=RTvR-zZh29D0=MOwNYboNSeKkNr_Z4v74Q4hn1w@mail.gmail.com>
 <avc-fQWSvmtHhtCO@ashevche-desk.local> <CANiq72=RbzZHgZEMfLkDRQx-_PoxEfgL_Ar8figchde5u5qc=Q@mail.gmail.com>
 <avq_fOVO4dina23a@ashevche-desk.local>
In-Reply-To: <avq_fOVO4dina23a@ashevche-desk.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Nov 2026 10:28:12 +0100
X-Gm-Features: Aa3M54r8jDUBL9-W_6ysQ9RsXI7srtGqUzJ6kqt-NYARrfePXpS4XD1GBsJdusg
Message-ID: <CANiq72mWNJ6qpxUrsGHGiRHeqb=uHMzqEuYLOkK50i40T=yHNw@mail.gmail.com>
Subject: Re: rant on Rust in kernel
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, ". Boqun Feng" <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 9:32=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> You mean for the in-kernel builds or in general? If you are talking for
> the former, this needs to be fixed as the version  we supply via LLVM mak=
e
> parameter (as you can see in my command line examples). Another story if
> this is broken on the clang level (but then how kernel is built?).

Hmm... I don't understand what you are asking, sorry. Can you please clarif=
y?

Cheers,
Miguel

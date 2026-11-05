Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793918274;
	b=xIza5fNja87EHBo/2tmPMbTvZzcv9dnBoCHyfN+NivlZQkapdimolxS0GKGhaodWnINn
	 4pjnub0j+yRRo9A491SR785nzvhhJgT/gmeWGszY3zEhMkqdS7Vt4KEloC5U146Vo306R
	 9aHd39CDuq/Azw39ikmjxejp/Mcx5IVycB1Rr61up7dZKbEOJOP6HzQsL7mMsJOwVnfkm
	 SA0uWXe70n9ekbretSsshpAuUT4neTwLkCpTftBvVkmlHB0kCiWI+qmZQo0Y3w+pYQcbN
	 XJ25fmyjwQ5OShw49734d86OaaaPnJ5dMNH29/YrhgEcdIO9nbsmqcSQbQTeh1iwL0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
	b=Vi33EGojdnxY6o9vW1zht0/faC5Wcah9v2MBGeMDMYCuAH0X4N4GcqQUqqWzCoMEe+93
	 5awGv/0E2dSXMZj9ZhQ/a88JmUQsYqKqBUy1BXThpiIbRw5nbChaHnlNoF4cm0wSzilie
	 abofq2f/Cq2bfZG200M8H4O+4UT9o8ESk7GnGvbdHqPYqoC0JHVS41KNOEaEjvLnK8wMC
	 ShNbFJWubUF9yEXznp4SRXwp4QwUmMVW3CKH5d0mAJpiztWWGICjuMqfyaZRFZaPQqvOA
	 lMvJMHEMs/5ubt7ihSRaDtwO1yCzTOGVc7C07iLxHSSzwDxMbjzYxWe+Kltv1F9Ev/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=opHuLUG2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526D4606A31B
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 22:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 526D4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=opHuLUG2
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso27992f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 14:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793918273; cv=none;
        d=google.com; s=arc-20260327;
        b=i8JG0QxDJhi/0E9vASdhsIaeRdGtWFgwA2duuhOGscptdPsyaYKdwVffNUveUd4qj8
         yIYO1QVlbobxhlonBsN4nestfc8PDjX/pm7wQw10xe4Y9ptH8qoIYLoYjHpRc8ZgU2cN
         kXRw4EYLpUXikndiP1hoTbDGAGRaR9yYFtZakYYEEr5AH3ckrcgQn3M9eAMAsAnkF753
         0urq6S7fyzhpAXPA2Md7WgsVnx3Pod0TNnT8/Xir7wGGNmGhlI15wBW4pbo/KRQO56VJ
         gxhsjZMcbkBY6MqCoGqJI5V9AOsWkNnnJFW8Cl9YiSgK1p+6FiMjWqNtWGYEWxWqq/Pa
         WRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
        fh=K8YM8JAoSuZbMQHozVHuLlzywIJdsjLZH4tzLxuGDLM=;
        b=elN/DFwt6ANFZehNqhiZJV+SY7Pm2yJlzoL9pzmCdAOAL61V1w0CvvONtvr6MVlmAC
         iumMlnPZ8m5XyGrIFDijqjJbqyVznKYVnUryprfm7v9KZ3DAAn+t5FUH60xCDntmwKdf
         UweZzhYikfocRsv2PPvD5BmI//1y15LHrrtd5LqxhSBYyxT79fyR2/B4U5oNEkNHxmc+
         nfE9GZRuq0u7CZoFq+SoFS9tO0MkvL0eBjJ/BrVNBy4ndQvk4Rhn7sflrtgwLyFN6rjP
         RcEFwAFSVfgVykJpI4CmOYRYTlLPdac/SuhUAYUToMGoJcvws55dJa2ogL8G3OK2wOdz
         MmgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793918273; x=1794523073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
        b=opHuLUG2Ypj1WDXfEVKbren+oLeZ7tTP2atdz9P8ZLVMn5bWP98aqZ2tqSEJI3N2DB
         nuBkm5KX/67E4qBhrw6fnCpA5G1RGMwR0qeTPW7RyVab9S2tsa/I1UBK5nMljn1rMAiz
         XOt13rzEPcGx5qnVaycMfqu98U5KOuu6ltfT6v/2zVzVjuLqtZsfv5An2j9NqccasfY3
         +RTHJYMgNiNMaoUv6HCBIECQuBQzbBkdoRoOoTSc7zjezrVMPd+ax0NUn9lZeT4uE2YL
         6v9CJoYMMnbZH5MEDHwYgIcfLYNHONdgxYICT3NUUtSOaGe1cht0K8hkNmy5Hza0PbOz
         YKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793918273; x=1794523073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
        b=w00OQ7Pe1EF0PuWAbu94yBJVoE8JoIzlDgP7kyYEP/oJJyDwf0WoQvK7Yp/jQ8mpHK
         3LIjHiwCgg5OEyF2xdvopSBnAYISvIVIKb01C2+Tt26VTDPwC4uFLCN/VCOALqaQtgfC
         th2yx2OCecxViKUnDueNHlyvaL7Kyu1Dq1OTsfxkNfT5A+zM13AUrJBL6jUeSu9nSy48
         2S3fBnVzPW1rjq0G+f8U3BZ7kdfBNmBMH1yE78WZSEU6JtbWcRqOy21Gu038JXJ22iUd
         CAQbTbPM6RwnO/TBPP+EY6ah+wdJg04lODjGXZ25yyl3cROOZ1CctIfa2vRonapNsyMD
         VSHA==
X-Forwarded-Encrypted: i=1; AKwUvBymtSCLMw8uC9Iq1wlIHgaDdKAV5OZ0QlWTGJWKkYKBDFjyzBP4KXZn+b7b3vuzma2ZdVmY3Jdaky/f7cU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+z8lnIdCISoZb+JOPuh+4lQvAYoZQ+WvE2Z7+VH0vF3sWp6Hkn
	NMZRB8s3NfLktghwGgkEWwi3ek1QN4hmNJkxkrPhcGwMC1rYESPofx5KKRpKOFAb+KkNWVBxjYL
	KDayeJiRH+5y6MOcWxQETn4CQFTVoHz5Nmf+lH1Tw
X-Gm-Gg: AYBFou08oyKwrmykFcWtwj0npxgvbArrO3ySEoerUldGzSD4M8UBeWKsnZUGlDbHuqV
	t0U9r3bw7IVQ//KgMYmKvTcP2e0TnThT71SPzjDC4X+jh2nrLX0TePFGorybsMbUGf7kAnICaWz
	rqM3LLjkoFs6TFJ2l9R47mFPZfGbgQBcErLtxr9gJvwOi5ccfAhALYzGA1QY9ru8zhMIjdD94gm
	1SPgsFq1bqtD1ExdeBUX9el1H8YLyf4hDQ4gxmwc5qYjpM2IzNRUBWKc6lVuUo3L6+SOjmxpJC8
	9pzGBPircSQs3hzTkkdoNRwv70+gWFTJs2urA9D+xc2x3Z6Qs2RtyRXVlqDHkqCRp69j3XGTU3l
	VhY2z44h2iSWvzviyUDJ6vL7FYmVpUx2pLsLXIxmmS2LypgRod3MEi6vqWtWjqTnFG4TBvwhYmK
	+m8wowObWkNMvQfgKmfpgwljOTJiRoxGPwKEqkHFZcI2pO15SDQMGiJj4gHq0Gj/Tc+HtC1isg7
	Tzrb3rSTsD0gSaogwpxX5BX7IWwpC+9GdgF
X-Received: by 2002:a05:6000:25ea:b0:48d:f39b:83de with SMTP id
 ffacd0b85a97d-492732dc7edmr1852328f8f.3.1793918272221; Thu, 05 Nov 2026
 14:37:52 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com> <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 14:37:41 -0800
X-Gm-Features: AclHuK8wUx6mjaq5nmDzGyrOyknjILFX8cjQ_WCJLMf8UUGbwiTYmUffT-QGEo8
Message-ID: <CAKwvOdkRAB7QUApoYyKU456GF3bY67PKqQRfbtmW1gcFbpAFGQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>
Cc: Rong Xu <xur@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Yi Kong <yikong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > 2.  The recommended usage model for kernel AutoFDO (as documented) is
> > to use the same source. While it might help in an iterative build
> > model, I don't see a strong reason to use it if there is no source
> > drift.
>
> Hmmm. I guess in the purist sense we'd want the AudoFDO profile to be
> for the exact source. ...but from my experience, that's not what
> happens in reality. If nothing else, developers locally working on the

Right. Rong's recommendation makes sense from a google3 perspective
(who I suspect is continuously regenerating profile data), but isn't
feasible for Android or ChromeOS (who are not).

> kernel still want to keep the AutoFDO optimizations so they're testing
> as close to what's in the field as possible. However, the act of
> working on the kernel will touch _some_ of the source. Keeping AFDO
> working as much as possible seems nice to me. Of course, I'm by no
> means an AutoFDO expert and mostly just got dragged into this issue,
> so happy to defer to the experts. ;-)
>
> -Doug



--=20
Thanks,
~Nick Desaulniers

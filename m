Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794658983;
	b=cLuHVgS6M2RII1aHXACZeMR/uXxOS9Sj+qmz3Jsl3I7WWhpL8J3lBkv/6ftv+wRA5hp8
	 TDNC0FXa+c+ildCZkT1WnZ3jWEpko14fEAhEJnOlzYrjhmUkBkxmJ5x/erB1gm8zK5Xj5
	 p3k70BStHxjtHcWhaMAKegdZ3pdxwJ2IH/6XyUJI9Ik5HKWwRdYXciLSfsSTFHx7JKvue
	 AeaXY1UXbC3M1Rj+ZFqkAjvy2si+CHhDBwql383L66GrsSruUQojv1X5Y4XSQOQVCzFQc
	 OQh6QB7ty6aGDFpdS/TLG7eExZHtjYbmrWqvExXjjvjYvysMll+msPy6/Hsez14PTaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jaNJY6v8J1Y8dmYnPR68moVodtYgswY39S/9vFvJmC8=;
	b=yw74kxNqk7pwocQEjrdyDLogajs3EWHRfI5R45voEAog3BmeiVM9dds9AxOZQk0HNuRW
	 xo3AFkk9F9Q0WGdwdQinmptP1J9mWYaGyn3vcVtVLZByV47unLUX3vO04hFjADJpJDjGr
	 udAGryvNI85ClhTRIRdQCeAwRFCWCDoUXgmd3h6z5MHKIQSXkJwlGPO4EaJwNlK8cY7Wr
	 vgaaLk75y0n191+ZeNFpc8eOceFnz8YM24s8/PkaYnRVTKiji0BAwuNc/2LVKM/j9Azl7
	 goQIFznIdhD0dmfMXY1eNJ7jXVyoYHYZ9CaKUfCXBh/d6fO3CVF+k4l296dEGwSTloA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrW3PskT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F057606A323
	for <linux-kbuild@vger.kernel.org>; Sat, 14 Nov 2026 12:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F057606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrW3PskT
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3719e3cb82bso222380eec.3
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Nov 2026 04:23:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794658982; cv=none;
        d=google.com; s=arc-20260327;
        b=C+N5JPZavVNoLODUnjh1+q6A3DS33ILJkjhllBkJvq6IpEiDhagudvB09XP7yECu72
         SWNcXxI8/QmYM2f3u5jmyvmaDR8KebMg5we/ieWIGAtusz7qFF8XlzAcgr0K91FULQkG
         /lvU2yQw6c6qiMtBia1eQn77bR2MRHQMRwdY1bpcu8rASZbe9orN9fW1wDWqPXXKHgR1
         /DMGlo1lYEePIm12b0UxwvoXIdsfDu5GNmqiileJihFTOdWiLJC7ktk4WGjP4QuDIy//
         lgDD5uIBFbH8Be9+V9idSnXDODDqUoeek9Uzcj9aV1HfJAI+7Yo0HjSyLh+KExUI79M/
         WU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jaNJY6v8J1Y8dmYnPR68moVodtYgswY39S/9vFvJmC8=;
        fh=u0K7nWzfPZQz6+bCJBb3T9EQoHS+mdbGzh2BTsMHO6Y=;
        b=j5BtkPDplF/F78S3uCxFktazDL9PyXz2hUOeN9Hcyc4WodQl3TKu9b88lPGCGmlIF4
         LGzG8QWvM/Q5xihKQ9ppMN2MHmM5eEtZNkTjm7LYzvGWC3Tblf0cZT+IhLaR4vfghxA5
         4vwaLM1moSHzLlVlcDkINwSVdlOJ+XVJ5kO+DILiDODJR2w/DqJ59cVE00YVTsQnP87A
         DZGa+EncJa2c6E20Krhry2omXumzjFHXs7MyV1C43AQXQ/72Y0ligX21ktiTfyB8K5P0
         cXTF2rFLDoHE/TPtwu6t7ut1Ur8oyioASVLnvatSMoQL1F1myp3loM2hSb54ZYG2yRRX
         /9NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794658982; x=1795263782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jaNJY6v8J1Y8dmYnPR68moVodtYgswY39S/9vFvJmC8=;
        b=mrW3PskTmnsNOOseh5Gis6ckRmbh0AIZ6Qv5S1YkSotxYQm37tB6xWksud1ckFEEj1
         j5fNinNXKG8GSXDAWrLhPrJtYaVFYCgDxfSmVsRdVv5CIfEvuaTnNrVi29BFTct8aqU6
         fAUWLdiUIVA3uadM0pQdgD8kpBt8GMGgcpLyD2jsgBaV+lu0F8C4TXOm2XsmW94WwkVF
         zxquXD/a97LUoPYuvsrL0Bfsnee/kWrO061zcqDkzNjp2FB2eny6V9BqYVRqg7T+/LN5
         OCQWxQ+PpRwXkffLFAHhachAlw7lLEIECOkQlXvPg/LG6arcgExxlroX7yP1xMML72yA
         s5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658982; x=1795263782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jaNJY6v8J1Y8dmYnPR68moVodtYgswY39S/9vFvJmC8=;
        b=sqkgVaAsLJ2+qxzBiN9Fpur7MGC5eVIAnCCLFdJw5lejOAYbYZfhm3M1AxZGCdlOE3
         pJkyWlkyE8T1uf59fG/Xk2kyIryFGfbpwf7XYkH/O5I7mrzMNwwCz14b+NtMuZ+FynFe
         LXpRc9sTiMO7/GinQCHgz1lVVi6kuXxB61Uei/oWnCObA7qGSoSQoRQZJUxkE5YtaLTq
         j/RcdoW/srhOT+vLNBt1hu/CsIg0TE/PiIGxoWJXt2OuWunI+lp4gnOv8ZrCQEhrq6W9
         +OGOw7UbHUaRma+krL9VPQDKI4GvDNLwjmKB9+mGNVMhQV9t7sxSZHAERGsTXHL+vYNi
         /tNw==
X-Forwarded-Encrypted: i=1; AL+hErF6p029y33gtq3FPAQzT7T3u4k9MflkLPwXouWJXLlvem8ftcy87hX8s/aAP6PRBrpwBvzwkEcv9d+LF8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TMOHmiEZ3VdD7XE7fkVuRq2pKd1z4lLI/qRRd1EkLpjNnnuXj
	j2WaBvc/dJO8Y+TAZYteGSgyDt3U4SuZhaOaeFHeb6ALFhQ714p0GA6UQIKvUPIdWcKODgsIfZn
	8EePPA04lVwqgLyb3z4Q7Id00xSbdMQw=
X-Gm-Gg: AYBFou37QWjQrJruEI43JMN9THxe8O+HTDWb7OXArDmwY2jkBkQP7vaHfnNX6+Nwksf
	hLsx5WaZJupAH9vr6I+q6EDI359q+EmLxiUjNU2ZBMfzYNc+G6GuPxCo5bRkVpXcIRs/cSYD4l7
	NYRMyWP1Qf/7xNEPyoPNBgU6Vopg7pcG0IHuR7ZopYYNbtA/x7PlCn5XfvzToYNCGe425TD1rV1
	U89vt7DLISCztiT/F3xsmp9pABWhsErahcu30d4FCX109VdhORjo+IqgbMaDFdN6u2Yxgf5W65v
	6K6TZnwevu2rSDara0XNWQ/wNN2sveqT+oN1gMY3CDREMfxRPjhWFUKrZFhalHNB4Z1drgkbLgw
	wzjcbTZi2eJputVFKlzljbAgSc4SMrn3avrpxquCXq6tCYxfPMfs81+velvEai9t9ZyUDaSmFlX
	3A9bAkfYkcx6YvkHHg960+lXeaE8bvBKiUb7yQmhtoyObl2+/T74JL0m0KNoAPDcKK58VdrR0Nx
	jtK1bJc4TedUKz9XkuJOkdFXZTB/gR05r1Pp/S1LngC124J0ku0uIPjipg5II6mXd7coHt8uLDe
	mvrUDJ3jTPGfgqDJpA==
X-Received: by 2002:a05:7301:a0a:b0:375:f846:5b3f with SMTP id
 5a478bee46e88-3796057e734mr6801706eec.0.1794658982031; Sat, 14 Nov 2026
 04:23:02 -0800 (PST)
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
 <avc-fQWSvmtHhtCO@ashevche-desk.local>
In-Reply-To: <avc-fQWSvmtHhtCO@ashevche-desk.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 14 Nov 2026 13:22:48 +0100
X-Gm-Features: AclHuK9W-7_405GhRgqH984WkaDHdvlAUVLqko1dAoXTj2-Ely9eZMICKWwSnJE
Message-ID: <CANiq72=RbzZHgZEMfLkDRQx-_PoxEfgL_Ar8figchde5u5qc=Q@mail.gmail.com>
Subject: Re: rant on Rust in kernel
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, ". Boqun Feng" <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 5:44=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> Yes, indeed. Any idea what to do (see below)?
>
> Ah, it seems I was mistaken, the distro is Debian trixie which sounds lik=
e stable.
> Unstable is on my desktop.

If you want to build with Rust enabled, then you need to either change
LLVM or `bindgen` to fit the equation above.

So, for instance, you could build with an older LLVM (e.g. LLVM 19 is
the default one in Debian stable). If LLVM 22 is around you may need
to use `LIBCLANG_PATH` to point to an older one.

Or, if you want to use LLVM 22, then you could install the `bindgen`
from Debian testing or unstable (they have 0.72.1, which is new enough
for LLVM 22, and checking in a Debian trixie container the build
succeeds).

Or you could build yourself a `bindgen` from scratch:

  cargo install --locked bindgen-cli

That is the easiest route, and takes just about a minute to build, but
requires trusting something else than your distribution. If you do,
you can use `make BINDGEN=3D...` to point to it, or you can just put it
in your `$PATH`.

I hope that helps.

Cheers,
Miguel

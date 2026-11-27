Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783813;
	b=YxwxJnjB8QqGNfXgnkShCii9abb5fvzGInaG3USm9sj30NIf8nqxlKuPcZRLekX6Urei
	 DFhCabPQm2iDJ3dpaUbIfFz0JL9tANuF1r567jIIttQMKVMlECTY3SMJyVxBDgmUeqKVw
	 aT78mIhBdJHSiJxsjBGQgGE3kbwgsR8JNEicyaxAL1pgBR6EQ/ujMFRy2ZYOgPIrmkhFf
	 9eFS9cHjNQb5XXP/TNmuunofkfSaYvDKx1E6L5pTPBvoMPawvgKDniF5ct8u8WFjsgiwX
	 TYuKBoimYxfin4A7VFJ938DPTQZPFgauL0wrXPumnn7Mj+XB6HiYaQ+idr+LE10AVjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=FnO1x2d+/C83Q2nzhrZlov1274fH/sTNuAJTsOOpadI=;
	b=e416tH8cRhAfxN7wLTgbuzUUEwD+BIk5HKBv3BDAZR2p23j5J63EycQfcnPLTce3s7jD
	 lVV1Cyk6XtXzHGnuUlGRGDgXL7QuP3s0f2KYMaQy6Tv4Tog26tHrFADuxVbLuKQw9QgFB
	 tpp+lsFzODUIFgVc0miIWN66AtLZtAOMrNQo2Gxh6X/TaRC/65jVqSpX9bjxIREruDxF9
	 A1TZQatyJg1NMSl4V3XdZV51E7pcLXY7GihmqfVa6gQbE4uMCV7UlUHSuzPVH5hIkVMxN
	 yRO9JFFwHkKCz/DTkWzzQbI9zh4r08s9ZmkVs5DWGwvvtQDlKcnoihjNXHpGS36FkGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9ZhQYbE;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91663606A321
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 12:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91663606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9ZhQYbE
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so4431185f8f.0
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 04:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795783812; x=1796388612; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FnO1x2d+/C83Q2nzhrZlov1274fH/sTNuAJTsOOpadI=;
        b=e9ZhQYbE6j7PdWndI6E/2lrL2HAR+5o3DKCqdxs+8QL88rGptmUYZUjO3wQoUmxHp2
         veL+isNGvrK0WolaksoAQX4UHCAOGcet8/S3f12ygEWaEUmFPMNBdUhl3TZp3WAEGqf3
         4JT/Ef0JQEMP4Oe+fJBC0GH5e7tP42q+y8WCvFT+61J0p9Q9z3xO55YzUId+Pxj6K19T
         zx7Vr0wDZVwA57cWGopIVIqQ7y4uI+eAr0pS5Ht7IXmXMtfPzr9WE/niv/XqviILKLo7
         7sNEuxs7jD+uDSpbiduWphjj9Cgkl4SrtM8rQjSZJ7JL/mrssShWA0D4c/n94T9oWNSh
         /6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783812; x=1796388612;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FnO1x2d+/C83Q2nzhrZlov1274fH/sTNuAJTsOOpadI=;
        b=EGUPUKCdwW/+1oAso2MTvL+hvA2mlhnlqAyXjm0FsCp6PoM20NHzlGxVtFU92kxcXF
         pGhd2Ap4wx3jW61LS6WdGxV5xa2MPsWiOoDwItfLtx9jGst7jyjUHUNNkUE5xIuGpNmP
         LKMGfmY1j96sI4ORl29kjoOsaMt5rInaMkgAskbGcmIJZUt3olL0UULfIkc2gaaP3E8N
         Meeox/Dc4D4x50tcSviBodOfpA4qr6XEmmZXG94EmROO1N7/3cVK6Jxk//WI4LuyW91m
         Qhhd4pHqQiO0rp+S1V6zjV/fzmatIyPcjIr3l141Fxf9SZw7Xg85PSOLpf1X/O4DCWaz
         nOVQ==
X-Forwarded-Encrypted: i=1; AL+hErG5rbSztbn3LNUG4cIAGuw6fQrFi9HfOUx2OVfqRyDRp60yz3c93su/jAgcARj/xT9mYpXcqsPZdtTLGec=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cSxp84URDzfoOg15MxuJTuxlHX7xKfsgqjHTOtWZFwsePBUf4
	o86oxco4UTM0JMvgS/KJBCHtfydPGAlxdum54MSzHM9rjVpGob7QUEnm
X-Gm-Gg: AZFdTZe72+v//fiZqojJnYKWMEWSjXmGy0PgUhjyUb0ybAwTzGyzBBsbXSUYRKMsaVx
	ogYZJtufxOSKvFWImZRlUkB4C0xHR9vmkTdCZ2Jq1cIhD8IzDwYP7hnU32cvvCqAur1R0FmW49c
	6SDtujfI2Tm3xPU5eXmVTQA1EoLYTjuhX8/fSQMxVGFyYmpixP/sVAncPSPttRBvx9x3x5UfTgU
	6OG2gW51VLWnspUxPgt7KiWP++X0co9Ci1ROPgfAdtnRb8oN+qtKZRhpPxde7MRJ6pzhFacHjoj
	6Vg6YgsGpMNEr88DRTdey/iX8wthKmYLPZ6PrCCQjaUSss5lNH2+o1Fa7C+LXqdf27ai5dbINf2
	uxGX+vrv81GJ8csP/ANq6yO+M5IqO5RP8gbKlAYKlYlZsuHj8GR5ZSwxZJbwHs84PWwR/EO8f2a
	DF7XP2cHrdXsEjkkJIifE4AJDwRFaGnYH+mNiMAndaIk26g4IGHhOTKDlO1bt1ujTirq3BkSpPd
	b9S+TxcDox0eke7h2LH4D/Y6EkOfTsCA0yV8j9PnmMZZ96c0VIaPcuJhzFMpdoG6OturYTQnWrU
	8dOL3Nvo7TzG2Iyy9IUqqP1DF+a3oW4SpKTbq/yS52ohET+HZoKIGpsMdk1BFyrktieeCvWUgeg
	iiQPUteS7//ncudlO1w==
X-Received: by 2002:a05:6000:41d3:b0:48e:d36:77 with SMTP id ffacd0b85a97d-4abaa97737emr47215381f8f.4.1795783811629;
        Fri, 27 Nov 2026 04:50:11 -0800 (PST)
Received: from [192.168.0.41] (bl22-190-205.dsl.telepac.pt. [2.83.190.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm47852629f8f.16.2026.11.27.04.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:50:10 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <d9151015-1316-42fc-89b1-d93cb0249d6e@gmail.com>
Date: Fri, 27 Nov 2026 12:50:08 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] scripts: add bit count parameter back to host hash
 functions
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: nathan@kernel.org, nsc@kernel.org, samitolvanen@google.com,
 ljs@kernel.org, david.laight.linux@gmail.com, sashal@kernel.org,
 lzsx618@gmail.com, zuoan.penguin@gmail.com, petr.pavlu@suse.com,
 jani.nikula@intel.com, xur@google.com, sidnayyar@google.com,
 robertusdchris@gmail.com, acourbot@nvidia.com,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261127000015.3662267-1-julianbraha@gmail.com>
 <20261127000015.3662267-2-julianbraha@gmail.com>
 <CAHk-=wjcmmgrJy6rknMOTJ76O92QSAMSUaUPKC6N=pASPsxPmA@mail.gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <CAHk-=wjcmmgrJy6rknMOTJ76O92QSAMSUaUPKC6N=pASPsxPmA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jQ00QMhwmgorNfZxtX025rYx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jQ00QMhwmgorNfZxtX025rYx
Content-Type: multipart/mixed; boundary="------------OtdfgwIauxllpYjoIU7uHsIu";
 protected-headers="v1"; hp="clear"
Message-ID: <d9151015-1316-42fc-89b1-d93cb0249d6e@gmail.com>
Date: Fri, 27 Nov 2026 12:50:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] scripts: add bit count parameter back to host hash
 functions
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: nathan@kernel.org, nsc@kernel.org, samitolvanen@google.com,
 ljs@kernel.org, david.laight.linux@gmail.com, sashal@kernel.org,
 lzsx618@gmail.com, zuoan.penguin@gmail.com, petr.pavlu@suse.com,
 jani.nikula@intel.com, xur@google.com, sidnayyar@google.com,
 robertusdchris@gmail.com, acourbot@nvidia.com,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261127000015.3662267-1-julianbraha@gmail.com>
 <20261127000015.3662267-2-julianbraha@gmail.com>
 <CAHk-=wjcmmgrJy6rknMOTJ76O92QSAMSUaUPKC6N=pASPsxPmA@mail.gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <CAHk-=wjcmmgrJy6rknMOTJ76O92QSAMSUaUPKC6N=pASPsxPmA@mail.gmail.com>

--------------OtdfgwIauxllpYjoIU7uHsIu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/27/26 01:16, Linus Torvalds wrote:
> On Thu, 26 Nov 2026 at 16:00, Julian Braha <julianbraha@gmail.com> wrot=
e:
>> Accordingly, adjust the callers of 'hash_32()' and 'hash_ptr()' to use=

>> the additional parameter. This is a pure refactor (no functional chang=
es),
>> so pass 32 to preserve the existing behavior.
> I think this is the wrong approach.
>=20
> I'd suggest hiding the size of the hash table in the table itself, sinc=

> ethey are all constant sizes.
>=20
> You can do it with some typedef tricks - not exactly pretty macros, but=

> the end result ends up pretty nice from a user standpoint.
>=20
> Something like the appended TOTALLY UNTESTED patch.  It builds, but it'=
s
> literally a quick hack.
>=20
> What it does is to turn each hashtable into a 'union' type that has the=

> hashtable head array (as 'hlist[]'), and then a special 'hash_bits[]'
> array.
>=20
> And the 'hash_bits[]' array isn't actually used as an array, it's
> literally just used for its size: it's the number of bits the hash tabl=
e
> has.
>=20
> So now you can take such a hashtable type, and always turn it into the
> number of bits with just
>=20
>    sizeof(hashtable.hash_bits)
>=20
> so now the hash table itself inherently carries its size in bits with i=
t
> - no need for 'ilog2()' or any other crap to calculate the bits.
>=20
> And at that point, you can now just use the high bits of the hased
> value, and you don't need to pass in any hash table sizes.
>=20
> You can actually even pass pointers to these things around, but you hav=
e
> to do it with that original named type, because the size is carried in
> the *type* itself, and it's not just an anonymous array.  Nothing in th=
e
> tree does that
>=20
> We can't use this trick in the kernel, because the kernel hash tables
> aren't all fixed sizes.  But for the scripting code, this should make
> the hashing really syntactically simple because the size is always
> there.
It's a fair point - I see why it was simplified in the first place.

Will take a close look at your code. Thanks!

- Julian Braha

--------------OtdfgwIauxllpYjoIU7uHsIu--

--------------jQ00QMhwmgorNfZxtX025rYx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCawl8gQUDAAAAAAAKCRDElYPCBXNxILMM
AQCI30PiL/2psxDIoyOwHOQ9RY6h7g5E5tfq+Gq63YwniQEAhEr91ZFvAJF3tQJGNDhi8qqDWe5b
5WTY6N2nBSYumAg=
=nk8c
-----END PGP SIGNATURE-----

--------------jQ00QMhwmgorNfZxtX025rYx--

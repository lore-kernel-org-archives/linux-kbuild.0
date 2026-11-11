Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420480;
	b=HeEd2F0aude0uAfm71tj64OlbEIBwk8EwK4inO1/N1BCFDLZDfLyNmH7yShDeniSkw/y
	 i1rnT7UaZXTgwm/ae3ppaPbcbTpYsr4qL64Kg1QhKTQoaHpN6jr4MxqptmpLLo2FKKPYi
	 UFW9sc+1gYjclt9UKL7a4BB1hCNcJSnwA9Q5wpNIf7uFMKUYc8H/g90vNoyJAqDOvOATV
	 JIFZbgd9darF8IdA0YSwnXYYUlKjyMPZLK/6NYUkRfZlBow1f4XKNB5DYkkMf2wlIqwqT
	 hQ03GWgA7VJtWd79WHYS6kewLcqUlSPshCDLNXZ84A/GiGTDvUK/lL67XEyv6jYn8Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=Dr6L6LTyTheZ7MJebrdlyOleZNT81+rS/ZxvoiAlOaw=;
	b=c+vfziqd44flTYRG1EHCqf1gIJdHfjmP8ld3TZgLnalqiPtnHDcTC/cRCaFrdEK+cBRV
	 a5fT9rECxqk48qXRtlipv4IvG6/KQ84vPDYXpLFlzS0b98YywXGdD3KIEfJw5fgnSvrUp
	 Y+02jQOBGrpmtUt42h4hqnJ1657RCnFEJK4c9L0744SjMGMLdYSrld7I5ooEVo0jN2NzQ
	 qqhlL96xGrHMZmFlZLB2mn+MWj4wDhVq57go4SFTpUe3s9e03wmHgsd71MPAdDRZ4aWdP
	 CAbUpNDJ/BzL+HJ9Y643lqVFguq/LV3Zxg0tIUB0BgpjCmC75e8C+76KL7zptDc3edg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QV7l++OH;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18563606A326
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 18:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18563606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QV7l++OH
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so30171555e9.0
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 10:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794420478; x=1795025278; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dr6L6LTyTheZ7MJebrdlyOleZNT81+rS/ZxvoiAlOaw=;
        b=QV7l++OHu5oXrvyos6kVgKAF61odJvQOV4pQB0SyUQNg93kawQf7XkH0+nrF6+6Vb1
         PDVCBSI4ecHINuXBN98jyDRYDx8uh0wsBJ0xPIxz3ResvthtwtpwXXQgKhs99HjEKq0P
         /JrGpog3Irn+S0DZGEDuRmC+7tChOhY41MLid+ugTBQd5GwJP1DPlC9ecwdmS49FQe4B
         a+Du6XfiCxsipOC6GdIVA0YZLBG598UTljaTKIWlN61/iSFyGbfgS28eo/76OYuYbVii
         OO22taFJdYgv1xs+Umo6dtcIpKKI5ePp6vMEvuznAWJ/qQ3NkWgbdEQUZf986gl8jKWa
         qY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420478; x=1795025278;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dr6L6LTyTheZ7MJebrdlyOleZNT81+rS/ZxvoiAlOaw=;
        b=gLa86EcBPPFik2Cg0pfTFAGSb/xwYLcaSqto++41++51gXxOH+Dm4aF/yu5YULEpea
         KeGAR5gnXFB+PwVLQySyUvvfyEu7jmFAj8l4+C+2c+HV26fMXbLd2U7QcF+GyBi0F6JW
         ktGBJpcT8Sf2zhyU7Y60hU60LTtJn/D3RK4u/qrP6w5SAeRkNj3oqTVutL2x/p2HPS6+
         7zUiluLvwyQPaGtQTox8B1sG6z4xanl48saXo5a6/hIbKEuhZJxlqEXYKPoAaAFE+7q6
         RPRQiGAKpWlHT44xFLa1gS/C2nWsW269RBL4iERNMouqGRvCOW5jVDO4GsK9wm6JwefJ
         HqRQ==
X-Forwarded-Encrypted: i=1; AL+hErFXc8rQQqbE7tYI8VLpbk/RvObGKlJDc1u9I/IwgRFKunk91VibV/YBXZ5YioHfhJPWhyqvpAlH1jfW2PU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Um/Sb5h4zCi0PtD9+Lhd3LqyozxsSBenR1s28KdEk+3Vbob4Y
	TnMFxF6Oofcs2inw/gHZ583ZmeXZo/kIemRCtmSWMJ7ajAgg8w6l4FC2
X-Gm-Gg: AYBFou3GdRoFQS+VZP4p1NqvyQVOyMI1qJI4meseXThcRsZohpFjn+/XPzxDuGnlikK
	BUQAsQEQYXvaI43D2MH75Zmo2r+iysR5HgCICWnBZcEZsFtpdP9q9b3bFKZGGBTcWXXjoI2w603
	qxQ6fTUDqy1FKQ0ei/f8LNFYEiks0DocO6JcglMldBC8Ml2AN1iFHnkeuODzQswWeFEYL3ZsBUJ
	JlhQDWb/lanTQEFRE+6cpWcl/bEIxnUBEHJ1QjFcMahobTuwOd/E7Y2B3hxXg7OUyBjFXfsKzFE
	ou0lYOL7zo+3+R17OCTu9UISF9pSuBfAcJjADoTCOqTOjGhXOTsec98SipUmK0447lOh7MRJ50B
	S9Fsd175TffknhMb7Af+3TTQXwTHxEfc7Mj1+z5mzC+Dy+FaDknPjL2qHKjxpJd3rCguoxfLBcH
	jdww2Kd90ydORRrpLazBzkUjq9PN3WFUSrfxd0AoTXbJdzME7k18GAqrZN6yj6jNa4NOVvVul7S
	w/moqPGs8MtuTPtpQVmBe/UAe22TF/81A/djsY3c1iXE+4hIpryB+GaWoRLbdq4+sUucbWHfDRg
	VE32Av0q/aJftLt/NjJwbIWut2GDlyah91O/yrT2l0LYa31PATsC/4w4gHaMknL7jNclov0dHNn
	T8dQqqrK9V0x0gj1pdvNXKVSm+z+GP1zHSjCISLomjUM=
X-Received: by 2002:a05:600c:34c7:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4ba093583eemr53113775e9.9.1794420478047;
        Wed, 11 Nov 2026 10:07:58 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e27a8b0sm5301115e9.15.2026.11.11.10.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:07:56 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <86085222-625d-41aa-8b60-2ac8960ffb76@gmail.com>
Date: Wed, 11 Nov 2026 18:07:55 +0000
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
Subject: Re: [PATCH v2 2/3] kconfig: wrap long expressions in menuconfig
To: sashiko-reviews@lists.linux.dev, nathan@kernel.org, nsc@kernel.org
Cc: ojeda@kernel.org, a.hindborg@kernel.org, nico@fluxnic.net,
 rdunlap@infradead.org, grahamr@qti.qualcomm.com, jakub.git@horky.net,
 linux-kbuild@vger.kernel.org, gary@garyguo.net
References: <20261110173526.1548434-1-julianbraha@gmail.com>
 <20261110173526.1548434-3-julianbraha@gmail.com>
 <sashiko-outbox-209420@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <sashiko-outbox-209420@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2YgqhCnYwobn2orogHEgpL9Y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2YgqhCnYwobn2orogHEgpL9Y
Content-Type: multipart/mixed; boundary="------------DYp1KHBOXMdl7yEfQ0JE6JLl";
 protected-headers="v1"; hp="clear"
Message-ID: <86085222-625d-41aa-8b60-2ac8960ffb76@gmail.com>
Date: Wed, 11 Nov 2026 18:07:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] kconfig: wrap long expressions in menuconfig
To: sashiko-reviews@lists.linux.dev, nathan@kernel.org, nsc@kernel.org
Cc: ojeda@kernel.org, a.hindborg@kernel.org, nico@fluxnic.net,
 rdunlap@infradead.org, grahamr@qti.qualcomm.com, jakub.git@horky.net,
 linux-kbuild@vger.kernel.org, gary@garyguo.net
References: <20261110173526.1548434-1-julianbraha@gmail.com>
 <20261110173526.1548434-3-julianbraha@gmail.com>
 <sashiko-outbox-209420@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <sashiko-outbox-209420@kernel.org>

--------------DYp1KHBOXMdl7yEfQ0JE6JLl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/11/26 17:35, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] kconfig: broken '(' and operator wrapping in
>   expr_print_gstr_helper()
> --
>=20
> commit 89202a55a9cf081fc680fbfa051ebe8d0cfa7113
> Author: Julian Braha <julianbraha@gmail.com>
>=20
> kconfig: wrap long expressions in menuconfig
>=20
> This commit wraps long Kconfig expressions across lines with matching
> indentation in menuconfig search and help text, keeping '!' prefixes an=
d
> value annotations attached to their symbols.
>=20
>> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
>> index 2b91d16bf14fb..9284ccb20259c 100644
>> --- a/scripts/kconfig/expr.c
>> +++ b/scripts/kconfig/expr.c
>> @@ -1155,30 +1155,40 @@ static void expr_print_gstr_helper(void *data,=
 struct symbol *sym, const char *s
>>  	if (sym)
>>  		sym_str =3D sym_get_string_value(sym);
>> =20
>> -	if (gs->max_width) {
>> +	if (gs->max_width && !strchr(str, '\n')) {
>>  		unsigned extra_length =3D strlen(str);
>>  		const char *last_cr =3D strrchr(gs->s, '\n');
>>  		unsigned last_line_length;
>> +		unsigned int prefix_len =3D strlen(gs->s) - gs->wrap_pos;
>> =20
>> -		if (sym_str)
>> +		/* Ensure the value annotation stays attached to the symbol on wrap=
 */
>> +		if (sym_str && sym->type !=3D S_UNKNOWN)
>>  			extra_length +=3D 4 + strlen(sym_str);
>> =20
>> -		if (!last_cr)
>> -			last_cr =3D gs->s;
>> +		last_line_length =3D strlen(last_cr ? last_cr + 1 : gs->s);
>> =20
>> -		last_line_length =3D strlen(gs->s) - (last_cr - gs->s);
>> -
>> -		if ((last_line_length + extra_length) > gs->max_width)
>> -			str_append(gs, "\\\n");
>> +		if (last_line_length > gs->indent + prefix_len &&
>> +		    last_line_length + extra_length > gs->max_width) {
>> +			gs->s[gs->wrap_pos] =3D '\0';
>> +			str_printf(gs, "\n%*s", gs->indent, "");
>> +			while (prefix_len--)
>> +				str_append(gs, "!");
>> +			if (!sym)
>> +				str +=3D strspn(str, " ");
>> +		}
>>  	}
>> =20
>>  	str_append(gs, str);
>>  	if (sym && sym->type !=3D S_UNKNOWN)
>>  		str_printf(gs, " [=3D%s]", sym_str);
>> +	/* Ensure '!' stays attached to the symbol on wrap */
>> +	if (sym || strcmp(str, "!"))
>> +		gs->wrap_pos =3D strlen(gs->s);
>>  }
> [Severity: Low]
> Does expr_print_gstr_helper() mishandle wrapping around "(" and wrapped=

> operators?
>=20
> When expr_print() formats a negated parenthesized expression such as
> "!(A || B)", it emits "!" and then "(" before the first symbol.  Becaus=
e
> strcmp("(", "!") is non-zero, printing "(" updates gs->wrap_pos to poin=
t
> after "!(" and resets prefix_len to 0.  If the first symbol plus its
> "[=3D...]" annotation then exceeds gs->max_width, it wraps after "(",
> leaving "!(" (or "(") dangling at the end of the previous line.
>=20
> In addition, the guard "last_line_length > gs->indent + prefix_len"
> assumes only indentation and "!" can precede the first symbol on a line=
=2E
> After " && " or " || " wraps onto a new line (or after "(" or "[" is
> printed at the start of a line), gs->wrap_pos is updated past that toke=
n,
> making last_line_length greater than gs->indent + prefix_len before any=

> symbol is printed on the line.  If the following symbol and its value
> annotation exceed gs->max_width, expr_print_gstr_helper() wraps a secon=
d
> time and leaves "&& ", "|| ", "(" or "[" stranded on a line by itself.
>=20
> -- Sashiko AI review =C2=B7 https://sashiko.dev/#/
> patchset/20261110173526.1548434-1-julianbraha@gmail.com?part=3D2
>=20

Sashiko is hallucinating this time.

I mean, what it's saying is correct, but this is intended behavior not a
bug.

- Julian Braha

--------------DYp1KHBOXMdl7yEfQ0JE6JLl--

--------------2YgqhCnYwobn2orogHEgpL9Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavSu+wUDAAAAAAAKCRDElYPCBXNxIHCK
AP4vp9i2du+IMG1TAXWX8fIRLdqwBhfKh22XNBYcb4Z5qwEApEedx8d8HxSEf9Bzx5914VRB9W1r
h3M4MMxDa8Dulwo=
=dZ0l
-----END PGP SIGNATURE-----

--------------2YgqhCnYwobn2orogHEgpL9Y--

Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0509730DEB2
	for <linux-kbuild@vger.kernel.org>; Fri, 31 Jul 2026 22:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535643; cv=none; b=WqmxMFBdsxY+31SOqF0UMSCBecKgRecl2lW164sdSWkF7Kc1ICqhlyWvneLOk+0HHpG/Wrd+I/aPWO46/YroZ3Z+Jej7Yl6U6naqmrK48Lq/mq8M0Dl4B2RH2OFPsl7efUf+mKrbCyn8TFWAGLqVEUETy9Jr4zLk+gA7U8CwEvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535643; c=relaxed/simple;
	bh=OIn675hjNJRvCax+siqTy5GlefZli5clf+OOhh2uufM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwZ4xkYcnDi1mKOS/E5Oyl/J+K64ba2lLKpRRXYmures0DSoXKA1DFzNsbIvGLOHCEDj99wGGO9jbtOsamx/+qxi7cxF8M8EA9qoSvwnimKBvXXPsfWUVmFjHX3cpJodqwySlocmZC9RvTgnMSJ3Gy5TiCSjHczIgu6b8Z092Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+ke4+ZQ; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+ke4+ZQ"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-668296d0ff3so1989407d50.0
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Jul 2026 15:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785535641; x=1786140441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lLVrqlJPaYUyQ/s2uocQTjVeXAjhrYhz/clQBuZIliE=;
        b=Y+ke4+ZQZfSJUKkDIgMzFWCpIx17RrfpGMJldR2pZnXhKKQF6A2d1YGKPhulNqG9GF
         GHP5VyvxDWh6IDSslQ6nuFn6GfXXZk+tUHn6uwgAg8vkoKWhi4KAmaouVYP/bhoYOOLg
         TEaZQ3hQrErMk4Ag4aVxYag2U0aV/8wg2+C4q5PBepwC4lVsuk2l+Fkk8xYOiE4bVNrv
         O1JN3FZXNG7EzRd5d868HdPrMICXwnLITftZGxG+jC6JloL+GXYAJM34iMGDEUGGQ72r
         KM3s+IkV6oJmWrS/Yg0LEH4963DQlvMZ8Avaor1fyUhoKLrVNCWtllNXRFy7du5+7gJo
         fxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785535641; x=1786140441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lLVrqlJPaYUyQ/s2uocQTjVeXAjhrYhz/clQBuZIliE=;
        b=BoEMNp2phy7ziEedOJYtU6lMVGdLCkvL1nF4/VbwKoi+DS/XlAbKvPRs5FsFWR7e8l
         BWxTrNIHlpWTepz8rifOT1Ug6nzgr4pwHXXH4ui15p1eMZDSEkbCSPYHVnNlbep97gqs
         B42PrjnPiRImdDHCUJrOeQp2252Z+6jhA0qoh95duTFcL29nS754WzFz5/fbrFbalb7D
         gMlQcu4f1f2L5VtjRQzZ5kXkyGt6z0nB6eii+yAs1D2ZmKAk5383N6rVDC2hg6QvCNY9
         BTwee0wepukaSIetgkaksN4MDCLvVuJETEhomNao8JccXvM5BJb4ym0PUwRGUYukNcds
         21Zg==
X-Forwarded-Encrypted: i=1; AHgh+RpgyXxAWRIk9i+xr9hgFGS8F2Xo7JXH67pTEIFvQPPqqdOtZKoV6AIgU4Xr6wi+qNrToFrWlNxWiB5VjA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoS+E0NHyEEyfIpiAMi7YjZVVsUItY0lsE6sFmHngFg1PfTkZQ
	dB3qFdr7wbGpIGt0DyaqoIScfxsZ31S5y5kq0RDcMtq3qERj1fJOpoHN
X-Gm-Gg: AR+sD11jgdJQCSjavwXLOxZVcA8S2ZLh2Kzs2u3UoIFynfAz1GMKEhiZTgMqR22YCaI
	++A98PG++YZZmDVRg0LOjONxvsgWguydHbvC1e9Ku1v7UQLHqeAsG7duADxu6TuR2wuveToPxSF
	LGMR1mFXYvzvrF7y83mpxwIBVgHhgnQ4hJKI3VEY0zcdNCZiYOZLGzHTJfMv8l48fedim/bcOVx
	mYVD91NXsIMQeI5FIK88/B2bcQtQdq6b+q/i00nsSM/GJiY5DR4saYcIFBmVkPtRjvsGrnmQapS
	oed0rT6KeF75ZUnQNkziKHtSY6IdX/R71eGs9FnPSc5mJy/oxLJADovW+dIbM4AFhLw/tTFDHiA
	QqLIeVifs8V9x5tEI7s9R+X0NmXMHQ/gW4pDkI9u0uflj6h/UBE7G656LrbJbQiW5RAN1/Fru2n
	gKfD85VkT4OgLEi5CtnexTVxDo3GHxJyxC1EHXH1dfJRMVc+tJ88iKQ7U=
X-Received: by 2002:a05:690e:43d6:b0:668:8b5b:75a7 with SMTP id 956f58d0204a3-6694f08c3b8mr1660952d50.11.1785535640713;
        Fri, 31 Jul 2026 15:07:20 -0700 (PDT)
Received: from Gentoo ([191.96.227.11])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948b98babsm1442207d50.0.2026.07.31.15.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 15:07:20 -0700 (PDT)
Date: Sat, 1 Aug 2026 03:37:12 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usr: Correct a spelling by changing a latter
Message-ID: <am0ckPayPdCQjnCL_Gentoo@unixbhaskar-laptop>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>, nathan@kernel.org,
	nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260731102211.2327476-1-unixbhaskar@gmail.com>
 <219d161a-8d8b-45e5-84d6-195c80a24ddc@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jz0uGldF3vn8rCHO"
Content-Disposition: inline
In-Reply-To: <219d161a-8d8b-45e5-84d6-195c80a24ddc@infradead.org>


--jz0uGldF3vn8rCHO
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 07:45 Fri 31 Jul 2026, Randy Dunlap wrote:
>
>
>On 7/31/26 3:20 AM, Bhaskar Chowdhury wrote:
>> s/dit/did/
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>
>Looks good except that the Subject has a typo in it.
>
  Gosh! What a paradox!! V2 coming ...

>Acked-by: Randy Dunlap <rdunlap@infradead.org>
>Thanks.
>
>> ---
>>  usr/initramfs_data.S | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/usr/initramfs_data.S b/usr/initramfs_data.S
>> index cd67edc38797..e92fb59b3fba 100644
>> --- a/usr/initramfs_data.S
>> +++ b/usr/initramfs_data.S
>> @@ -3,7 +3,7 @@
>>    initramfs_data includes the compressed binary that is the
>>    filesystem used for early user space.
>>    Note: Older versions of "as" (prior to binutils 2.11.90.0.23
>> -  released on 2001-07-14) dit not support .incbin.
>> +  released on 2001-07-14) did not support .incbin.
>>    If you are forced to use older binutils than that then the
>>    following trick can be applied to create the resulting binary:
>>
>> --
>> 2.54.0
>>
>>
>
>--
>~Randy

--
Thanks,
Bhaskar

"Here's looking at you kid"-- Casablanca
https://about.me/unixbhaskar

--jz0uGldF3vn8rCHO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQFPBAABCAA5FiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmptHIgbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJELI6nbcRSykVFngIAJZUmCrwBzus3pyzqYcy
CsVIziTYXNPeGluGM4sYSK2FCXs7UJVcy4zPNpoLGtBmSyC9FlEvQEwlT7o82gNd
ZW1KItp9WpJDePL4y5zVZkP9/z6wfKtjWFzxaM7By8k52wKt/iYKliERwXAjk1bs
ity5IiVeC7Pf1Eo0AFhGJXtrbmJQon6CqugyIdRNe6JHt0gWu6lt8CaAsrgpXEIx
XAcgkBWzV2jBQVgyi11kNB6EyD/hqbYjQFik9WZUQGuqCLDlHLdQC12s9f9FdOSb
stw7aYYkwloedCjFcp1XEGUpySrUaUu6sHY2zOeCXkvkTjnQRMcoKMcckeqUR8N8
v94=
=9RSh
-----END PGP SIGNATURE-----

--jz0uGldF3vn8rCHO--

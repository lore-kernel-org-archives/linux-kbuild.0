Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68161360EDE
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Oct 2026 22:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326397; cv=none; b=cVY4VnSCcrwxe4pb/rXeX5WhW0/QyOefCHmgp+tsOtjguKJYX6DiQVhTHzulme6cfXsm0AaWvflK38T1Ra8elGY7nSWGr8nQJAYiMqkPVBd6yM5fne440bB2VVo2V0dhOp54n0Ya0cNoof7wGIpmNDThp94kfigetKupKoSCdgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326397; c=relaxed/simple;
	bh=AdxL2XdONYmbRXYyv/1A1S77fovnRsIOafIkjtja1Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJVZsCqN+/9Is/iUrFGJnrrN/bpNfHxNq/hnpuk0Zwty8h1O0cqoxl4QMo2L3sjcvm5GeUW+znw16nMMKtROAbAq6Leb5Vj9OSKk3e+wGAmtDdKmjykBigSwKm4Xhj+/pw/c/gmNxk+sZssI53N678FGwU5L0pi1lhuOaiGij/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=n5OmXMUO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="n5OmXMUO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so21479395e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Oct 2026 15:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791326393; x=1791931193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AdxL2XdONYmbRXYyv/1A1S77fovnRsIOafIkjtja1Ys=;
        b=n5OmXMUOpMTFQlR8q3KqD9qIFriQA1h9DTmkOzzYO7hQmcJYog+2Xz/YLh/lMD0U7I
         8JA/WkVRDtvn7j3YrkXhNXdbTuMpFWQEyC9SoP0pmw8jVM0wKZ10YoIqcN5d6WCL0VVA
         Ua4qV/9qTdMGcI9Y0t3MZzQv3sbAe4n+rifzmbMvoPNqdLAbobzkQfeQoBhUPZqBlnJ/
         lFK30J+C99o+NF5rPyGven1uzQWyNd5YNaXWGHPTzmAnVkjYqLLs1lHn7P4+/iN86eHW
         I4NmQenpYW7RRgAc0ywyKXE0dDCtvPGjjoQfJCMefpwPu1BfBDaf6tJMyAnJac3DLQ2+
         utvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326393; x=1791931193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdxL2XdONYmbRXYyv/1A1S77fovnRsIOafIkjtja1Ys=;
        b=2oMfg2pDdKZ5GvXbWg0NxJ+3nkrg8m9+u5JQqlUxipFVTXclgPfqNpqhOyIMUXrv7e
         orOGBJAEEgi9v+2GaPreA+iDldoSMDpxo2pUQMiOQV6kT1MAe6E7Uuc8UiN92IFZTy9S
         wqrfCvwG9zPHtvXm23nwJ44FIVTpNR21p+SAInnGSqcV6LFrTENSwI8IwiTXfY89JzJv
         8xAaVmKTbOx/oYCaTuYpE+gC+Z0G9DdYTS5Ys29HyE1tUyNwSizEFyvzXXiazlci9t0v
         tKS7ur2VUgMFEOB9P1ooYjnEu3T1M59wQCZdTDdK0tQcl4hCkiZ+EksFBsWz2ArKpdPP
         8g8w==
X-Forwarded-Encrypted: i=1; AKwUvBwAx7dEFZ/4yjv3pVokvvE2Az/Z1jQLUoCxamj1jnI2TeIANb5p91rjllKcwu1l8U6GOW9mI9CLdT86SsU=@vger.kernel.org
X-Gm-Message-State: AFuF++mLC9agscEYyWcgyP4Nlfo53mnjMdWzr7TW06N44GLgeL8FRIl6
	8tPVUC959/aiJfW8hoSXWqyEYENhFGPpm7xSCwnIt7EY+4yI2p3G2D/7ekqAvSb4Hb4=
X-Gm-Gg: AYBFou019ePfMOaJ30CKNfdOYLb3iWarZeDHfhE75jJjqaW96wtskRergvsjFltAccJ
	z3uIj/9wLXKiTFv39GWYTCyenIUqaZqhNXhWFMxthHkqEyPEAYuKm7EDJa1k7zwzUvnBqvkUZ9C
	P/TIcnmaESnzUwIWOxuCHX42mMNuNrpX3JZB1FehX+G5wBIOjkUGzS/PG38lAH8lt0zaJFXyS5c
	yVwqS+aps6+qaxsEANiVRxu2CmXkeQAtRw2ndHhHav+1tTm7kEoDiDcue/9rzKaVXLIhATqOPca
	LPliNrhA9ZqREGcpEtGVMwDjbCcwS2VSyV7PbkrtwtoqIeQ2cnGj/zd2PcKrLP51li2IgqSBfSG
	tv6KjF2gOuchyksdIaUNor5+MLD02fmOoE2UMrsBdRPtsx3ftse4FtoyJIqFFVN7gwMa4ponwhO
	VKsfVB1ZcNohCrR55pLyGLyqmUbu3FgN5SxNnMSheBL2bbsWIieBUKWQoXLASJdXEAFzw77A==
X-Received: by 2002:a05:600c:3b9e:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a180660fd4mr3921435e9.27.1791326393614;
        Tue, 06 Oct 2026 15:39:53 -0700 (PDT)
Received: from localhost ([213.151.81.74])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18044c970sm4177245e9.4.2026.10.06.15.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:39:52 -0700 (PDT)
Date: Wed, 7 Oct 2026 00:39:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Raag Jadav <raag.jadav@intel.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>, 
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Alexey Gladkov <legion@kernel.org>, Hasan Basbunar <basbunarhasan@gmail.com>, 
	Hugh Dickins <hughd@google.com>, Armin Wolf <W_Armin@gmx.de>, WANG Xuerui <kernel@xen0n.name>, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v1 0/3] <linux/mod_devicetable.h> deprecation continues
Message-ID: <asV4UKTFRPv4gCUx@monoceros>
References: <cover.1789988540.git.u.kleine-koenig@baylibre.com>
 <179121379654.1159753.4410832336442519712.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c7j23svchiupmb33"
Content-Disposition: inline
In-Reply-To: <179121379654.1159753.4410832336442519712.b4-review@b4>


--c7j23svchiupmb33
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 0/3] <linux/mod_devicetable.h> deprecation continues
MIME-Version: 1.0

Hello Nathan,

On Mon, Oct 05, 2026 at 05:23:16PM +0200, Nathan Chancellor wrote:
> If you would like this in 7.4-rc1, I am not opposed to sticking your v2
> into -next now but I plan to finalize the Kbuild tree for 7.4 around
> October 15, so we'd only get a week or so of build coverage. If that
> feels like too little, we should defer this until after 7.4-rc1 is out.

I'll look into your build regressions and then I'm happy to get it into
next for 7.5-rc1.

Thanks
Uwe

--c7j23svchiupmb33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrFeLMACgkQj4D7WH0S
/k75zQf/Z9M3Qv+MzXCE+/ArZCIjcf7D1SB/7qYHmlMpHOhpIQCpv43i8PqY8WOv
ulcwbwStLe9f4pjnBVM0/Rm9nby9VZo3bK79LWBMwnwkZORonA2EqgQdsoZdfRp+
rAETMDcFUQ9GUGhN7DAcWMA4xZhjUtso0mWGwtF7ExTFgEpE33GWQUBdTInG2TNI
0u2gVDxfb010LE6jzbHBJLoFNE/8LEPyCVyCCWsoCz+xslpavz8+KA5j3Frpl3Iz
ier5fkw0XOws8piZfouheZOaXqDZ/HcdrhFTBW9mXVnvMLiUaiH05aCOv9h33Etu
n9pm75LVifFbz4hIGjjZonFwBzkLug==
=5U0C
-----END PGP SIGNATURE-----

--c7j23svchiupmb33--

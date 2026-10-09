Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80FC4D90D5
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2026 17:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568247; cv=none; b=ITQxKz93m7AW4E7yLBkLMDcprnW48I1CxlRwDmqZSVRqX5dDXbngZL68LI6a6UVb05beL6vR8NIHt2Lh7qsgdjRiX4jCvpMMUF+E9/VAPz1zSOCMu4uNODuOwRqBTWn45OTvMViRFvPyLeHOYtrvhq+GwHFuxOIR26mzPvRfUDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568247; c=relaxed/simple;
	bh=WamLBlsKicbvMN84nu//E+GEDYaz+ghaJeYJo0L0wF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJv2/qn1L/ONiwP7FsZS+ZwEthkW9aPJ9Zm/W4hfIYHvpBUJDL5xR6bQmEgLJthlcZY5W9PaN/TdgTcswKoAeKoKzAwY4j1YkEJNx9AbWQ3yKFQR715tGtZgXR+UVODYqdkyaGRnFj8HQ+yyTPrFRYCU+Z10byprzgpJuoAwO14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEPpS5a0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEPpS5a0"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e608cd460eso21590045ad.3
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2026 10:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568244; x=1792173044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJ9XeYQkqhsjchhR0kegBTiZB6XHwagNviFnMzxLQE8=;
        b=hEPpS5a0HL6SZR2CuA8rnNtR4gs6AOQsoGHc5/kjdWCDE+XOqhYyYMTUH5MC13f6R+
         kpaBAiNFJ+A44VDf4+EGJOgDz237JnHgORfpY6xWEeUn843ecQTOWCdj4bmn/bAA4szv
         yXHEUC+IzODdarFT1W/JXpAfOPeLNwazM164RDTqgaQ+SIX8njOB4rPNRrNEO9lEaMGt
         3Lw8RRdOy2nBMGANG47TrdwsMsYNwINtl8gmQPkDtxRgKxDMSh2Njn0DmtfaSY9Sdo++
         MYPpsMuzDX8kVV11zTG9o3PSfzertFZDei1GUTyQAAb3egORcALl+3lGUR+pAb0LPPe7
         9JJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568244; x=1792173044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rJ9XeYQkqhsjchhR0kegBTiZB6XHwagNviFnMzxLQE8=;
        b=KljbwXS6/tglz25GuCKU3EAV1+hxkUHUf5Fif3ic4yvBGj8dIfJAoCkP48jqUlD+hl
         QIQMCAEHvvJTQLK4HINLkI87ry7btUchC/aHWY5BSZu7znHYsFcEvmwZmLE6eS5Wt2so
         3oedm/Porj314BUlPkA991ltrh6t6k2SzLvG6x6znT7gCA12pSlsa45wXxVVJ4tdNCSs
         Vpw7RsPakHK5axQ2Kff5oTrOCj8lOxrP4FrpAOnWHFZ57aXMPLq57iFU3LyhydJ8Igh5
         kNdq+SfPGX3nuOAU1yFW2JlWbaMJJIZzPa/LGxeneZh+ABuT/4nJq4l+xgMW9GiJLqvN
         FoQg==
X-Forwarded-Encrypted: i=1; AKwUvBx8CjY672/1yhNDs1YE/+hYwxWBWgNew17Vhc8yQz+uCnANHTXELzFBLtNOLbBhLFJ09HtXOlReNGbptok=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd2O84B9Up3c/xNK0ONNwrDrOzx6NTmY2ExwUWJBd/yjUpy4OW
	mkwo1Jk6kISICscL6nB6XeO2/V9pXJh6JUe2d0KLkTI1F0d/oW61EiO8
X-Gm-Gg: AYBFou0dNy1fxBEEEi5Gz+CpHB68dYRurlzIwZuM9WGByVWlWndwax1VFdyn657b0XU
	FaYh2dmK+z5bp3CiwrdABBI3muLScGsvmu+LTH7r0Jq2VFn5djifY/xPwiwP7RNUI/TKRgCjxdA
	grTHr0RrRMd2Q6r2LvJxxrHNgQX3ubWa+9ImgxI/W9KJ/OEdI6yv6SpakoNbQJ+5KeFGpSAD955
	ZsGCQkYFHDIx9FM0vhc0GMNQfFAscRVX0bvs+HpsI51qrZMXNLj+KFX+UaM7nfXmNiEz9F6hjoW
	KNByBpKpocKppTxhBz7MqSvP2rxqonZHZEzvynr3AoAWDTuDqdZlZ9rQMotcpgt/HORVJcddpoy
	pEDFFUjK9uVR/ibbnFFlwhKlUOvCLCPgp7sokfc/LpE9Tce2QXAWCpC34EkqLG0btFWoxc9eMUq
	C2fSPSmVcu7/4rlWWUJYZ/Re/bI9h9iNvLxrhQiFw9Qv8eP6t1LEevP3d9aWFIr5sTI8EV4a0z7
	0xz0cLJfNnnOyKVYSSBmq3FW0vRpHJZeJKcCe+F4t9aWamwWlybMSOnmkblhC2O/PrnXEWuhBdl
	o7qKuXViNF3gxZoNhmE/qiwI/fQYlGAVHcfns2owigjIf9EOwSCldJJIFe5FtvQ9m5tR3dQ4cP4
	79pD8InvvZEhbkU9U
X-Received: by 2002:a17:903:8cc:b0:2e4:b218:f689 with SMTP id d9443c01a7336-2e842abfe6fmr19557115ad.53.1791568243896;
        Fri, 09 Oct 2026 10:50:43 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:d58d:323::50:f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1562sm14512165ad.34.2026.10.09.10.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:50:43 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/make_fit: Ignore schema checks when decomposing DTBs
Date: Sat, 10 Oct 2026 01:50:23 +0800
Message-ID: <20261009175024.2212-1-ue081723@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <CAFLszTjiX+oiDBsm7MccvZqhcMae=4Dh5x6ULHSLDRMQN8NwZQ@mail.gmail.com>
References: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com> <CAFLszTjiX+oiDBsm7MccvZqhcMae=4Dh5x6ULHSLDRMQN8NwZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 9 Oct 2026 at 08:13, Simon Glass <sjg@chromium.org> wrote:
> Reviewed-by: Simon Glass <sjg@chromium.org>

Thanks for the review, Simon.

Nathan, Nicolas: recent scripts/make_fit.py changes have gone through
the kbuild tree, but I did not Cc you or linux-kbuild on the original
posting, sorry about that. Would you be able to pick this up, or would
you prefer that I resend it with linux-kbuild on Cc?

The patch is here:

  https://lore.kernel.org/all/CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com/

Thanks,
Ting-Han

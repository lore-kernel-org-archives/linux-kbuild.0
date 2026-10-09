Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C37547ACDD;
	Fri,  9 Oct 2026 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560043; cv=none; b=pQt1yQglwI6a5BaB3feYy2zhi0/tS1kzdFitPt6SnqcK0Z6kYNsO36gt1ZX+S65YRP/BK+JwzbAI4G5CDogtzwKhy7ijMajQlNwqwmFYYfudcRRbNAtBAw1UbXycw5V4DHW4z5zUDy/Rr1JZUHuFWXam33zveM+qH5iMZThq9/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560043; c=relaxed/simple;
	bh=8/hs+uxmnb1AlvzVgTn3+rKx10N6yAlb+/hmxxKdN6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lf5sfuGS48EMRLqdtbDsqqTTJSU4YiLgttzX+HfG1siUbm5drbxHpZA7rbH30Y6XoZkH5NLV+aTTYVEr6pX9lIXGqDkJ7d/Z1o2mSXF+y7gJ0/bgjsdFiqrra7HX1PR4bfHAdObIVgKUH2U4ppYGBE4RGLYYuPfi1mmcmdq/ueI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=JzdWsx8q; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="JzdWsx8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1791560029; bh=8/hs+uxmnb1AlvzVgTn3+rKx10N6yAlb+/hmxxKdN6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JzdWsx8qlwTSuS9MCqt3PZODAgFuKelwKoCORLKWp2H5E29Dg9Orboiw+bJ3T8RRD
	 7J7FSFXxBqoggbofBqlF0nsV/RrSM8Xtzi+r6xkgDpGmyFepZmZB9anKL+nuWLe5At
	 XFYuYJvaxOXfsYRTgZ7dIOdmaPGA3DZ+Kbz7Ka5Zo0KFV8kGo3eNvIkebfxLID6X+T
	 lmGsbF3x6BXZBfj59bJR668IqNHiqbtQ7/v58/KTRr7dOiHZ404bFkgID3Y5R9Drdd
	 lig7WSMD/JmACr9TgwVLVcfAL+H2oliGv92Aiia3g9fSSlAyEH9WLdplo7j+SqDDIj
	 X0CB5XshNw0Eg==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ac9095d-0462-7f0000032729-7f000001e130-1
	for <multiple-recipients>; Fri, 09 Oct 2026 17:33:49 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri,  9 Oct 2026 17:33:49 +0200 (CEST)
Date: Fri, 9 Oct 2026 17:33:49 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: kconfig: cleanup stale comment about 'keys' array
Message-ID: <20261009-military-tangible-wolverine-dfa93f@l-nschier-aarch64>
References: <20261009094617.17322-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009094617.17322-1-julianbraha@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1791560029-E3FFD94E-6CA29C63/0/0
X-purgate-type: clean
X-purgate-size: 488
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: C3E9BA048C  external: no

On Fri, Oct 09, 2026 at 10:46:17AM +0100, Julian Braha wrote:
> 'keys' was removed from 'dialog_textbox' in:
> commit e14f1242a8be ("kconfig: menuconfig: simplify global jump key assignment")
> but the comment referencing it was never removed.
> 
> Let's cleanup this stale comment.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  scripts/kconfig/lxdialog/textbox.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

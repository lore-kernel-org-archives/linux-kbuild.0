Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1D9344D95;
	Fri,  8 May 2026 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269738; cv=none; b=aJWMWbc4bGsUOmU1U1VQU0jooh9+9g5+1HKjqQ0qbtM7n60UtddlK95HFWysv2eoHk+MX8E77hxFX1ZRzI5HSL9egILCAIyN57FzCHRqikHyZlUi4PgCX4lwdWKQWQBIHRtmjujrm8DRKhRulTPo2a4EV2VBdrN3Kj2R63L/+Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269738; c=relaxed/simple;
	bh=3SV/vTeM7G4mieMIcUvbSvqIjspKebu6/kUdPpthl7c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jr5LjiCKj7EGtxTruj5f5Zn7I4D1//sw40Lu9x+N/B/INhVDZTKJXFNKJo/0RHtiO72mE4L1cpUppC0fWCPs0typBSgFhP8BfyzmHsZCqzhs1HHsz/clTTunNuKPNKjtm4jlEYvBdW+qvbXGX//Jja+G4X13U9i1wFd8aw/lhI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CAdw8aIb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CAdw8aIb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23450C2BCB0;
	Fri,  8 May 2026 19:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778269738;
	bh=3SV/vTeM7G4mieMIcUvbSvqIjspKebu6/kUdPpthl7c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CAdw8aIbE1cYAvofAP+Mb7uuQMWaMcNu5t0wGni1P0Xu/wVy1MSiO46hmpoSImakv
	 jq3P/W6aopOkIAW6vqbyGWKhyao4JkRr0oOWRr+2HEZ3HY5CVfMvEKB4mThfcrarHn
	 ST04oTWmoHIlVpy5ftY2YhpqBBf0lESt+JQQ6zmw=
Date: Fri, 8 May 2026 12:48:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Peter Oberparleiter" <oberpar@linux.ibm.com>, "Konstantin Khorenko"
 <khorenko@virtuozzo.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Mikhail Zaslonko"
 <zaslonko@linux.ibm.com>, "Masahiro Yamada" <masahiroy@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, "Miguel Ojeda"
 <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Pavel Tikhomirov"
 <ptikhomirov@virtuozzo.com>, "Vasileios Almpanis"
 <vasileios.almpanis@virtuozzo.com>
Subject: Re: [PATCH v2] gcov: use atomic counter updates to fix concurrent
 access crashes
Message-Id: <20260508124857.97f80d47875a240b9d46d3d0@linux-foundation.org>
In-Reply-To: <c66e6c37-2068-4adc-bd25-3f8aad9c5195@app.fastmail.com>
References: <20260422125112.3583649-1-khorenko@virtuozzo.com>
	<20260422125112.3583649-2-khorenko@virtuozzo.com>
	<3786062b-ce93-47e0-8eb1-125bac5dbb2a@app.fastmail.com>
	<ff2a4c49-463d-4d8a-9519-bb51308f7ba1@linux.ibm.com>
	<c66e6c37-2068-4adc-bd25-3f8aad9c5195@app.fastmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 07 May 2026 15:43:01 +0200 "Arnd Bergmann" <arnd@arndb.de> wrote:

> > 1. Drop the patch
> >    => not preferred - crash would still remain, and the consistency
> >    improvements would be lost
> 
> This might be an option for the moment, until we have a better
> solution though.

Compromise: I temporarily moved this patch ("gcov: use atomic counter
updates to fix concurrent access crashes") into mm-git's mm-new branch.
So the patch still exists, is still under test by a few MM developers
but is no longer in linux-next.


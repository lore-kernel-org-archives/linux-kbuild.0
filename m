Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5165137267A;
	Tue, 28 Apr 2026 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359695; cv=none; b=ket4O1A9ajFS4/GjmxpHdzoWofhJ0fFqfnS0W1GQJJQY+DhmNj2GXtlivBY6FHx/pf3dAnE/lg14sIlUxvd48OoiMSNanONSAk6yqOAfv9FJfZuXR1b4RrV/n5VTM3b4uHmjsyj4qMm7ch44cDW0SP6HxXqbxbckqkAiAGffR8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359695; c=relaxed/simple;
	bh=Qyfax9b2PWaORu+5g08cf0wvuZbpx4bQxHNJdxSztfk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nbZTqggYU0ylYz/jqc4wGPjUvKwGiQinjHugqWdEAkERTPcbE9QljzvvHnAUA1jGQ3Yd984iLBR395+tYDcLO/coHWpFfTMJYMupAB1ulpzxOkISLuPHcYY42KvKSeaOYt2EgSf3dNd2G0OIMGLwAmwq9IrcNxhmrRCbfJUZt2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=U+/zQodY; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="U+/zQodY"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 24B0040B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777359693; bh=Qyfax9b2PWaORu+5g08cf0wvuZbpx4bQxHNJdxSztfk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U+/zQodYv4dtWJpSq+X3pDYO989SyhtcnEIUaLEQ2AQNnXNEudHeIbW7jXTyN9jwy
	 sR7/06C/tT7GR7tZvKZu9nrkA2Mip6yNyqNaxIRSAP2zCvWsQdXTcY6mu3DdOboalY
	 UbCVdp3PrPZctrA9DRxHWtCED1T6I64kWti55YpwEN5DsGShWsk6MRMF180Rb8dEbJ
	 g/ERGLUnDX/nFzVaDbTXejJT+qD5N1O210aLXo57YwC6ZQoKNOcw97JNMEFAIdxDys
	 2vpSZRudmITmRZ5SvdbyQN825ExVUuP+iwEOd9i3GgA8bGY2KjLIjF/LRdNnmPJQw/
	 7/KX5GM69T/PQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 24B0040B0C;
	Tue, 28 Apr 2026 07:01:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Julian Braha <julianbraha@gmail.com>, akpm@linux-foundation.org,
 ljs@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, masahiroy@kernel.org,
 nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Julian Braha
 <julianbraha@gmail.com>
Subject: Re: [RFC PATCH 1/2] scripts: add kconfirm
In-Reply-To: <20260427174429.779474-2-julianbraha@gmail.com>
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-2-julianbraha@gmail.com>
Date: Tue, 28 Apr 2026 01:01:29 -0600
Message-ID: <87mrynmuuu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Julian Braha <julianbraha@gmail.com> writes:

> Add kconfirm into scripts/ and modify the root Makefile and
> scripts/Makefile accordingly so that it can be compiled and run with:
> `make kconfirm`
> from the root of the tree.

As Greg noted, it would be helpful if you said what this tool does in
the changelog.

Also, a nit, but I would really suggest putting it under tools/ rather
than in the scripts/ dumping ground.

Thanks,

jon

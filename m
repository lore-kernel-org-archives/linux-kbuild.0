Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBC9472F63;
	Wed, 12 Aug 2026 17:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786556226; cv=none; b=iOY07/IW3xnd4X/mNsFGevS+Lte7iV2sCgLrpNa6ws18e+sWBka4/+LLV4cIs9zACImw3aajpS0hD7D94+jUnnwmUjClmRAaT3KnUeOztXtowUPVzk9rkjT4wQtZbJ5cNazbNZr45u8b+Wy6Dxl0+24AMl/3rEYekBY47WIPmb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786556226; c=relaxed/simple;
	bh=QFo+YFnSP43pZiDbc5modT6S/XD/336zm0WFm/8l/6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgRmBcgUQ8/LUxJjr/8wKX+idO9Dmmsw+UJ94hgeKwcWpDehlTp9g/5XFmU4lsMAl/QHQf8BMJgY+DvkCASqTInnQU/rJw/Hbl6iRGaNAugWQF2ldpBlqYFMFGw9v0ZvIm3Y4+RTZmoqgeU31/tisr4NN2Lm+Iv6qQytFwlSE5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=r8EgoiUq; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="r8EgoiUq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=oTQe4NQGl55sCmpir0edgktW3GYYzoRIotlUKbOQzTs=; b=r8EgoiUqXgBm4JUMqjnyJ3mvVw
	ZoUyQu5ZW2kitJvy+QQbBZ85vEizIvjKsxumgFDoKSSUnkPT2WtWJBU7g6vqIsotXT5t2fuHrOnqH
	ODzL4xBiR82HUR9jZtTC+7+QJ6hpl9QDkfbteLZm+IutD9LMDURCoiVfNoxJ23Ksp/vC7Gp+br8Es
	TBAK3UogfIx2Jex8u/kx28wscFntZRnDZInq4aVjaeJzJUbCwf3PG0+hoQFhvnNKYZUOsnDJ39bp+
	sFvpI8UTj2NIUTAY/tQcPsbAX0NCQ6nWhzrd5Mf0koCnGRsL3HQ8p4mBUv4EIqXg6tnyP+cAkorTJ
	LRfJ4fwg==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wuCsm-000FG2-P7; Wed, 12 Aug 2026 19:36:52 +0200
Message-ID: <af92da09-4e89-4ec1-8286-01c0526f8c51@igalia.com>
Date: Wed, 12 Aug 2026 14:36:50 -0300
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] mips: Get rid of custom mips ABIs for syscall
 tables
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
 <20260812-tonyk-syscall_table-v4-8-748d0229ad40@igalia.com>
 <ca0326a0-ce13-4bfc-b36c-5612d73335fa@app.fastmail.com>
 <b1d599ef-bdf2-43e4-9746-4fc8d8f1e817@igalia.com>
 <a1d0c110-d23a-418e-9155-23b13b590445@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <a1d0c110-d23a-418e-9155-23b13b590445@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 12/08/2026 10:11, Arnd Bergmann escreveu:
> On Wed, Aug 12, 2026, at 14:53, André Almeida wrote:
>> Em 12/08/2026 06:16, Arnd Bergmann escreveu:
>>> On Wed, Aug 12, 2026, at 05:33, André Almeida wrote:
>>> I had expected you to use 'common' instead of '32' and '64' here. Since you
>>> did not combine the n32/n64 tables, this makes no practical difference,
>>> but it still makes the tables look different from all the other ones, and
>>> it means that the following patch to unify the tables is harder to
>>> validate since the inputs are still not line-identical.
>>>
>>> Is there some reason you went with this approach?
>>>
>> Ops, no good reason here, it was a mistake :) I will redo it to use
>> common from [1, 211] syscalls.
> 
> I can see this done in one of two ways:
> 
> a) make everything in the mips specific files 'common' and keep the
>     three separate files
> b) make only the first 211 syscalls in n32/n64 common, using compat
>     entries where those differ, then use 32/64 as the ABI for the
>     ones where the numbers went out of sync, and merge the two
>     files into one.
> 
> I've added Thomas Bogendörfer to Cc, he may have an opinion one
> way or the other.
> 

I believe b) is the best option here, as we can remove one more common 
file. I will add Thomas Bogendörfer in Cc for the next round.

Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4068713B7AE;
	Sun, 10 May 2026 23:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.212.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778455730; cv=none; b=ampIvFBvWzYp2niWU2395DM31AEdEyv8DHO4UpbKRn8mrYWzm5l4H3cZLLm+OA0wVcNIp58buacPGpKOQ3CRFR0463+EF73P8WEj88QhfJYOBEnLVCOHFoJ376KXaDFX/HHK5md1PNPSqSvIGzOWKnkgNjILYWSFDdfKryHJNDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778455730; c=relaxed/simple;
	bh=S12eo3xnpaNwWbpFQ6T9R0WxD5HlWwbvhRBm/5W0R7M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nm6CtEbPrbFER7Oboc04bEm9t+ms3gTzmBkESyXNLhtBx7Bdqnfv3FwcJ6x1peF7CZBZSrvl9PtgZNn10aQKiI7tAG3CmfxXkta+/fU7+5IP8Uj8WjLsRz48sFhdfa0kGHQX5x/Y/l4cUFUuopiAFXPDco3oFEtN13+R/D2BHjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inai.de; spf=pass smtp.mailfrom=inai.de; arc=none smtp.client-ip=144.76.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 25121)
	id 4F84D1003C5133; Mon, 11 May 2026 01:28:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id 4EBE411009D120;
	Mon, 11 May 2026 01:28:44 +0200 (CEST)
Date: Mon, 11 May 2026 01:28:44 +0200 (CEST)
From: Jan Engelhardt <ej@inai.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
    jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
    ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
    masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
    qingfang.deng@linux.dev, linux-kernel@vger.kernel.org, 
    rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kbuild@vger.kernel.org
Subject: Re: [RFC v2 0/2] add kconfirm
In-Reply-To: <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
Message-ID: <5220poq2-qq9p-27p0-3sq9-50q1845n76n0@vanv.qr>
References: <20260509203808.1142311-1-julianbraha@gmail.com> <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr> <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
User-Agent: Alpine 2.26 (LSU 649 2022-06-02)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


On Sunday 2026-05-10 11:49, Miguel Ojeda wrote:
>On Sun, May 10, 2026 at 7:06 AM Jan Engelhardt <ej@inai.de> wrote:
>>
>> Good lord, how is anyone supposed to review that amount –
>> or is it just getting rubberstamped anyway?
>
>[...] another option for that may be using the distribution's
>registry

That should really be the target. After all, Linux is not bundling
e.g. ncurses (for `make menuconfig`, if one wants to use it)
or libelf (mandatory for objtool and thus everything) either.

>the versions need to fit, one still needs to provide a way
>to do it for distributions that do not match, etc.

Linux, and many other projects, have run on a "The system version is
king" model for a long time. If libelf, binutils, gcc, libx11, or
whatever the dependency in question may be, the project trying to use
a dependency would add a few-liner patch to broaden the accepted
range, rather than trying to re-provide the dependency as a whole.

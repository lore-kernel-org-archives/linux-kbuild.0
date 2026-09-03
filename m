Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C183C3F6B;
	Thu,  3 Sep 2026 20:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467244; cv=none; b=Rj2jEUTVW64vPx5M05PHY5fVGvxTjL9H+FYD5YdCIsefcOQ9PEj/r6wiAcfeykl6so8UV9lPoTVnjPCsJJ6FBLGqCnX8xf0Ql9NFa/bvyOxh7QDqiIbkW17I5K525SmS4z1CM7aRtKjjZNRC11ctFEL9w+Cjk8IxNmEwxcRTRsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467244; c=relaxed/simple;
	bh=l91/UGkIDrl42dnGZ8e+BDegYiQ2Y+Zc+gpuFCj9TVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8UkrJB8d9K2hhdQHxKigWIezRZb3VKRDQXuyJlNr06jIr5edUoHqDanpFJgdobIBImxQgmXSUjzvW6Ne3hwTSVqnqHhq+9OCwJB2ik650DLOzOjalZUjfrkcKZjJtlIsL5dd1hTkr3TihkZdLcNm4G7d7+jufPFFHPNDMYj0D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEOKV5xL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEOKV5xL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6571F000E9;
	Thu,  3 Sep 2026 20:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788467225;
	bh=elkp0fXEfvHG6ANCalHkLSTiGly333WXYxFdC6tJUZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UEOKV5xL2pQxlkjJ1XVy7dMHYWTQqpMC63KRwDOArms6ZDlYnhluOig5OX27kLFPV
	 0B4mLTol/O9bYfPMciSNSfxJy8nc1tpWePKtvbI7WaPKsVZYjXrYDK1D6j/Hq8vUze
	 k6F8kZyhE7jrM+vVLxGsqy3vmWkbYMsyiL5gY/qUhgm6zt4FBBUv5Xc3c5XtIGz7Oc
	 J756KeB4ZdWJUuo10pBpcGt5lv5tosWkL6OuxngnDtMmGrsIwKwrR2+hfQai6fGgK+
	 9Zl5vBTazLyddJLAE9DCDia5KNbHPpyAoJLLwErRoaQjRJMlApJO5OvQqDoaSWfPNK
	 pFhHfK2hr7zCw==
Date: Thu, 3 Sep 2026 13:27:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
Message-ID: <20260903202700.GA3790602@ax162>
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger>
 <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <ed43b869-6fd4-4b00-8fd2-e9dd9aaf3349@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed43b869-6fd4-4b00-8fd2-e9dd9aaf3349@gtucker.io>

On Wed, Sep 02, 2026 at 12:26:29PM +0200, Guillaume Tucker wrote:
> So to recap, here's what I would suggest:
> 
> * keep Python 3.10 for this series, continue discussion about minimum
>   and optional version numbers tree-wide in other threads
> 
> * drop registry config file option in v4 then add it in a follow-up
>   series along with image name validation and parsing using regex
> 
> * leave TypeError exceptions as-is in this series, improve user
>   experience and error handling altogether in another follow-up

Sure, I think this sounds fine. I tend to ignore existing issue comments
from Sashiko when it comes to accepting a series, I would always prefer
them to be handled in a separate series.

-- 
Cheers,
Nathan

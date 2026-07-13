Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4E52475D0;
	Mon, 13 Jul 2026 12:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944992; cv=none; b=JKvNAJ//A6KDNgWMzQqUGzyhElWIkbpFqxCShoB90RnDywWaf6Ir7pH/d05klCwmGjlj5LCMS7tghbPymqvsURsonVCSiM4dknd7f3BCtkmlwpJz6ycPXKzNRJrHCWrK0kQhdiiAokZV/grJ+kCPoH8tUd1pxDsLRmmaLhPdFNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944992; c=relaxed/simple;
	bh=c1eld/fe5D0RuyWGTbnnae/aZMfXSzC6HcbmV5hl7GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiywXYC0PPNH60/1kefPIHwT8XgUWq7hsJ9ZuDSKb+afRZtl1Z7L2e6WNhtqzP69+e/QU2Q5r1yr1pnq0qKFNXqMlj2XfOfDQ3gc6wf7tvu8lieLhnsnhxU0NehuNVay3wx0pkt5uK5kSRE3SkTtMJFsJlY7TUSBNlHNWZOfh18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a54d71c-1649-7f0000032729-7f000001b8b8-1
	for <multiple-recipients>; Mon, 13 Jul 2026 14:16:28 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon, 13 Jul 2026 14:16:28 +0200 (CEST)
Date: Mon, 13 Jul 2026 14:16:27 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Gustavo Luiz Duarte <gustavold@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Breno Leitao <leitao@debian.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scripts: kconfig: merge_config.sh: keep temp file in
 the output dir
Message-ID: <20260713-practical-orange-doberman-a1baf7@l-nschier-aarch64>
References: <20260710-merge_config_output-v2-1-8be3de601612@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710-merge_config_output-v2-1-8be3de601612@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1783944988-A8CDEB3F-0D65D6C3/0/0
X-purgate-type: clean
X-purgate-size: 779
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: queueID: 7C64AA0261

On Fri, Jul 10, 2026 at 07:03:33AM -0700, Gustavo Luiz Duarte wrote:
> merge_config.sh currently creates a temporary file in the current
> directory. Create it under $OUTPUT instead, which allows running the
> script against a read-only source tree.
> 
> The default behavior is unchanged: $OUTPUT is "." so the file stays in
> the cwd.
> 
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
> ---
> - Link to v1: https://lore.kernel.org/r/20260708-merge_config_output-v1-1-e35fa223d6f3@gmail.com
> ---
>  scripts/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks!

Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Tested-by: Nicolas Schier <n.schier@fritz.com>

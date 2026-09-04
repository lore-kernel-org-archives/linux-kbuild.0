Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FE651E437;
	Fri,  4 Sep 2026 18:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546868; cv=none; b=pLLJnPf/z+U5pilgikAJlc9TIO0LNXy/mLMLSkyI0y6oHgV6ig9qdtkxjtXNB7j1WIPOfRBJcsgPhCQfLvVJxMGxafOgT/CAIitSl8D1HMeeRZVnNQTFNfQphvOcsvFccrpdRdFaQTcadtxnRyl0BXcMDGnSNrOQZ+hYtO0cn6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546868; c=relaxed/simple;
	bh=lt27UchPaDdsqKXnly6UKAN5TMB885tT3yzomVzDTSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oifutjMi6Nai547jcNXBNoUYJYqlWXVBmDVvd8aWpAZv59x/kMSRZgVXlDewAgvPeNgxgNX9q8ihtifrZxmkyOv9RvoZrcqyGta+Ed6YMXEF7u+1+1FL81Z7y8/tvXjkPeWHFBiuf8FZGQcSUCscDy07awCfD/WG1/QTxzqlBzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=ZA7WEWT8; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="ZA7WEWT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1788546851; bh=lt27UchPaDdsqKXnly6UKAN5TMB885tT3yzomVzDTSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZA7WEWT8PvUePYK6h0M0D7q9FCa4n+xSrwoZlC/l2d8QV8Eq+6s5toGo3mpg51wUt
	 WyjWErMoTEmCwm57JC/a7HNycGlTlHpadYg52NJ3SE2+YVEb9e7r+GyGLj7sr2dyGP
	 AQ0Kfbp6cWFUsIDM78q6si9tPIqsJdazRMJE3cWmPPPzIZcgRL6Es7hailiYu9C6cK
	 t4fX6NRPRfkoYkk3ccnHOvMW7o+a9MWMDrCsDcQorktVLIKbR2TNkHshMy1uk08WEg
	 Sc2Q3TH8xx370zszHMmilEbmbXmrN+SLUayGqs0ryjryH7k+PEV+1hQcUP2ZUqDXVB
	 BAxMZT77o2jxg==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a9b0f23-c6f5-7f0000032729-7f000001d34e-1
	for <multiple-recipients>; Fri, 04 Sep 2026 20:34:11 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri,  4 Sep 2026 20:34:11 +0200 (CEST)
Date: Fri, 4 Sep 2026 20:34:09 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Hemanth Selam <hemanth.selam@gmail.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: fix typo "funtions" in comment
Message-ID: <20260904-quick-gleaming-kakapo-aed84a@l-nschier-aarch64>
References: <20260904122002.27960-1-hemanth.selam@gmail.com>
 <CANiq72=QNpuvP01TfXEkjj4i7p4QU5WGj4mjHjrKyrUMsjEwWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=QNpuvP01TfXEkjj4i7p4QU5WGj4mjHjrKyrUMsjEwWw@mail.gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1788546851-64C0BB9A-5D0DD5E9/0/0
X-purgate-type: clean
X-purgate-size: 805
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 46279A048E  external: no

On Fri, Sep 04, 2026 at 04:23:28PM +0200, Miguel Ojeda wrote:
> On Fri, Sep 4, 2026 at 3:11 PM Hemanth Selam <hemanth.selam@gmail.com> wrote:
> >
> > Correct "funtions" to "functions", reported by scripts/checkpatch.pl using
> > the misspelling list in scripts/spelling.txt.  Only touches comments, no
> > code changes.
> >
> > Assisted-by: Cursor:claude-opus-5
> > Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> 
> Welcome! I noticed this one in my spam folder.
> 
> But, yeah, it looks wrong:
> 
> Fixes: 5270316c9fec ("kbuild: Use -fmin-function-alignment when available")

thanks for the patch and the Fixes: trailer.  As this is not relevant 
for the build, Nathan will probably pick it up for kbuild-next (aka v7.4).

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9400E3812E5;
	Mon, 20 Jul 2026 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561513; cv=none; b=EWyumsbgtTcEuNS2IdGlU0ghTn8Y3SVOLybYSqP72KiyrhkfZkkAtVNH7vCNLEZd4zeQdgel5wNrpVNFM5OgYM7lmym5SnJKti0FzPJY1CrjixDBqH7JDxKAU0J18O4Hqve9Wze1mBvInctMvqYZCkAqRcqiXueIqwJhfjgnk2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561513; c=relaxed/simple;
	bh=Uu5/MZw/TvP/7hOREOjMFx6nKaZoOrE+250s3KraK8U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kTIP40qiiJ4Tmqs+ziBJmxWde7+7OE8QHgs04Iop5ad1Y7Ll3oR4e9x6k4p6j1bDeUZCSlBQ8EnjkbwyY8cMsL2FeJqTprWoQ1qVwHq1C++X8S9Rbb/lSKN1FjE5Q5FbLt71bMEn4Jg45g1aYgPe9V/WrpNprR4R1pClW6crQjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 795C992009D; Mon, 20 Jul 2026 17:31:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7422092009C;
	Mon, 20 Jul 2026 16:31:42 +0100 (BST)
Date: Mon, 20 Jul 2026 16:31:42 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
cc: Thomas Huth <thuth@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
    Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
    Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
In-Reply-To: <02978413-55eb-4a1d-8ccc-d73060e46795@t-8ch.de>
Message-ID: <alpine.DEB.2.21.2607201629490.64835@angie.orcam.me.uk>
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net> <823e3bf3-ef3d-47cf-aff8-1668875a2f38@redhat.com> <5e05be8c-e9b7-4da7-a182-eefc5043cd2e@t-8ch.de> <alpine.DEB.2.21.2607161908060.64835@angie.orcam.me.uk>
 <02978413-55eb-4a1d-8ccc-d73060e46795@t-8ch.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 17 Jul 2026, Thomas Weißschuh wrote:

> > > I don't have a specific case I can point you to. My goal was
> > > consistency. Therefore I am against reverting the patch as long as
> > > both __ASSEMBLER__ and __ASSEMBLY__ are used in the UAPI headers.
> > > If we want to switch to __ASSEMBLER__ for the UAPI headers today,
> > > we should instead invert the logic of this patch to consistently use it
> > > everywhere. After all UAPI headers are migrated, the normalization can
> > > then be removed.
> > 
> >  I believe Thomas specifically refers to the mention of the alleged 
> > shortcoming of pre-3.0 GCC, which we've since verified not to be true, as 
> > quoted elsewhere in this thread, so the note needs to be dropped in a 
> > respin.
> 
> It *was* dropped in a respin[0], which is the patch that got applied.

 Ah, OK.  I didn't get a match on the respin since it changed the subject.

  Maciej

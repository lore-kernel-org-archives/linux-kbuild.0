Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E43D13DBA0;
	Tue, 10 Mar 2026 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773126927; cv=none; b=nH+lzJIKJanj6kfXds+oyit+js+p56hNzpWHjxlNqVnlCH1Su9Tp+x72b7wKUHk5S7R2uvVFdq2Pi9CbA1UzDhiE4Ny8Bz45h3/OKIx1TZyb5oklfsYb5B67Im83xpgbvwreE5H0UmC1pgLtlG25QMkasy2tuApZ+cQqTmVgqKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773126927; c=relaxed/simple;
	bh=hogRxLCoTUwm6tp3ZPsyJmoFrk95jPFwCleVyfZx7C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBLVEydfYpKizxhnSY1rzCMpnde6t616gLtRaVllG97mvMpR+iDc2bMzCJcnPEi2THQZPDedfs7z6x2f1/rnl6rikRjE106gonCOSFoFbR41f9LvpckBPBJqQMc7d1+oviTwFpegdMF18VrhBYz191iSW8p3yaHxGcPIk7fhhfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjsDFp7V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjsDFp7V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3D0C19423;
	Tue, 10 Mar 2026 07:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773126926;
	bh=hogRxLCoTUwm6tp3ZPsyJmoFrk95jPFwCleVyfZx7C8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjsDFp7VUnGUvbH1W+QrRdpHvv4qMHd2tQjtggxe/UQKFvVw2VR1fw43USq3MrqW8
	 eeJ1M8dgHOlwRd8iZ34JZnOLoP4UO0p/l1rRMCWQLqCbhLViJMHuw8uSIcbqU3dxfL
	 jRpS79vSWeSuC6eTq66xUrF4pNpykaBqh2jpPw6iuyWJ4IuT+HVNgdneCUxOhY+3NY
	 FbEwvOLa3kIljQqWapjaKaQlkkkjWShLIE6TGfQAfuc26vEurWLFeONJgWqt9ruIg1
	 cs43yNk2rNpJtqRiE8e9/NVdU1tBv/IRadhzTkEikZnC+xD5DOXUUYXPL6KLSDrn94
	 EMTotOaI7keSA==
Date: Tue, 10 Mar 2026 07:24:34 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Askar Safin <safinaskar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org
Subject: Re: [PATCH 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh to
 scripts/
Message-ID: <aa-5IhUnf4CBKOuN@derry.ads.avm.de>
References: <20260309-move-gen_init_cpio-to-scripts-v1-2-0c5059b1ec5b@kernel.org>
 <20260310014912.3023668-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310014912.3023668-1-safinaskar@gmail.com>

On Tue, Mar 10, 2026 at 04:49:12AM +0300, Askar Safin wrote:
> Nicolas Schier <nsc@kernel.org>:
> > +# Keep around until cleanup in scripts/remove-stale-files
> 
> Linus said here https://lore.kernel.org/all/CAHk-=wiHK5_oBUdUiNAaevmN9f-ORe+QBqbRefAZaw-RbgEn3w@mail.gmail.com/
> that he doesn't like scripts/remove-stale-files (this is my interpretation).

thanks for the pointer!

Yes, remove-stale-files is suboptimal, but not adding entries there
doesn't make anything better.  And yes, entries in remove-stale-files
should have a life-time of years rather than months; and removing
entries from .gitignore before the remove-stale-files cleanup should be
prevented.

Therefore I chose to add the comment to usr/.gitignore to prevent
accidental removal of the '/gen_init_cpio' before the time has come.

Does that match for you?

Kind regards,
Nicolas

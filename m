Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:38204 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755829Ab3HIMcx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Aug 2013 08:32:53 -0400
Date: Fri, 9 Aug 2013 14:32:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: Allow scripts/* to be cross compiled
Message-ID: <20130809123251.GB5794@merkur.ravnborg.org>
References: <1376046432-12588-1-git-send-email-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376046432-12588-1-git-send-email-broonie@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, linaro-kernel@lists.linaro.org, linux-kbuild@vger.kernel.org, John Rigby <john.rigby@linaro.org>, Mark Brown <broonie@linaro.org>

On Fri, Aug 09, 2013 at 12:07:12PM +0100, Mark Brown wrote:
> From: John Rigby <john.rigby@linaro.org>
> 
> Cross compiling the binaries in scripts/* is not possible
> because various makefiles assume that $(obj)/whatever is
> executable on the build host.
Please explain what problem you are trying to solve with this.
I do not understand the rationale behind this patch from the above.

	Sam

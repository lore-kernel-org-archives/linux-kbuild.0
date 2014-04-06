Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:43441 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753451AbaDFAFf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 5 Apr 2014 20:05:35 -0400
Date: Sat, 5 Apr 2014 17:05:12 -0700
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH] modpost: Fix ressource leak in read_dump()
Message-ID: <20140406000512.GS32556@tassilo.jf.intel.com>
References: <20140406003649.1ba3c993@spike>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140406003649.1ba3c993@spike>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christian Engelmayer <cengelma@gmx.at>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Rusty Russell <rusty@rustcorp.com.au>

On Sun, Apr 06, 2014 at 12:36:49AM +0200, Christian Engelmayer wrote:
> Function read_dump() memory maps the input via grab_file(), but fails to call
> the corresponding unmap function. Add the missing call to release_file().
> Detected by Coverity: CID 1192419

It doesn't matter at all. All memory is freed on exit() in this program.

-Andi

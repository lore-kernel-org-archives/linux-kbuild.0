Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:51845 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752358Ab1ASEgd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Jan 2011 23:36:33 -0500
Date: Wed, 19 Jan 2011 12:36:05 +0800
From: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH] unifdef: update to upstream version 2.5
Message-ID: <20110119043605.GA9903@cr0.nay.redhat.com>
References: <E1PfI64-00041z-0d@hermes-1.csi.cam.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1PfI64-00041z-0d@hermes-1.csi.cam.ac.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tony Finch <dot@dotat.at>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Tue, Jan 18, 2011 at 08:12:49PM +0000, Tony Finch wrote:
>Fix a long-standing cpp compatibility bug. The -DFOO argument
>(without an explicit value) should define FOO to 1 not to the empty
>string.
>
>Add a -o option to support overwriting a file in place, and a -S
>option to list the nesting depth of symbols. Include line numbers
>in debugging output. Support CRLF newlines.
>

Could you split the patch? It is hard for review.

Thanks!

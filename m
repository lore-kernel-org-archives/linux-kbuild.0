Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-px0-f182.google.com ([209.85.216.182]:65068 "EHLO
	mail-px0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753223Ab0ASOX5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Jan 2010 09:23:57 -0500
Date: Tue, 19 Jan 2010 22:25:45 +0800
From: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH] kconfig: dont hardcode path to lsmod
Message-ID: <20100119142545.GB3473@hack>
References: <1263883920-17289-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1263883920-17289-1-git-send-email-vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: Steven Rostedt <srostedt@redhat.com>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On Tue, Jan 19, 2010 at 01:52:00AM -0500, Mike Frysinger wrote:
>The lsmod utility has always been installed into /bin with the newer
>module-init-tools package, so let lsmod be found via PATH instead of
>hardcoding the old modutils /sbin path.
>

Some distro doesn't set /sbin to PATH, so for me a better solution
would be making PATH contain /sbin, and then use "lsmod".

Thanks.

-- 
Live like a child, think like the god.
 

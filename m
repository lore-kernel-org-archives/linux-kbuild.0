Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48995 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756252Ab2GMNHY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Jul 2012 09:07:24 -0400
Message-ID: <50001D87.1020708@suse.cz>
Date: Fri, 13 Jul 2012 15:07:19 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: allow long lines in config file
References: <1341964078-22594-1-git-send-email-cody@linux.vnet.ibm.com>
In-Reply-To: <1341964078-22594-1-git-send-email-cody@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: cody@linux.vnet.ibm.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 11.7.2012 01:47, cody@linux.vnet.ibm.com wrote:
> From: Cody Schafer <cody@linux.vnet.ibm.com>
> 
> For some config options (CONFIG_EXTRA_FIRMWARE, for example), the length
> of a config file line can exceed the 1024 byte buffer.
> 
> Switch from fgets to getline to fix.

getline() is not a portable function and kconfig is an essential part of
kernel build. Could you please change it to a loop over fgets that
terminates when the last character is '\n'?

Thanks,
Michal

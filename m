Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:63722 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758258Ab1JGCfR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Oct 2011 22:35:17 -0400
Message-ID: <4E8E6539.2030809@redhat.com>
Date: Fri, 07 Oct 2011 10:34:33 +0800
From: Cong Wang <amwang@redhat.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: Fix checking return value of 'fwrite'
References: <87lisype1v.fsf@faui43f.informatik.uni-erlangen.de>
In-Reply-To: <87lisype1v.fsf@faui43f.informatik.uni-erlangen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Reinhard Tartler <Reinhard.Tartler@informatik.uni-erlangen.de>
Cc: linux-kbuild@vger.kernel.org, Jean Sacren <sakiwit@gmail.com>, Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, vamos-dev@lists.informatik.uni-erlangen.de

于 2011年10月06日 19:14, Reinhard Tartler 写道:
> fwrite indicates '1' written member if a zero-length string is written.

For completeness, xfwrite() is called like this,

         xfwrite(str, strlen(str), 1, data);

so if strlen() returns 0, xfwrite() will print out the error message,
which is wrong, no error in this case.

Acked-by: WANG Cong <amwang@redhat.com>

Thanks!

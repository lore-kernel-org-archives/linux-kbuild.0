Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm4-vm0.access.bullet.mail.mud.yahoo.com ([66.94.237.138]:44250
	"EHLO nm4-vm0.access.bullet.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752670Ab3AWQfs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Jan 2013 11:35:48 -0500
Message-ID: <5100102A.6020009@schaufler-ca.com>
Date: Wed, 23 Jan 2013 08:30:34 -0800
From: Casey Schaufler <casey@schaufler-ca.com>
MIME-Version: 1.0
Subject: Re: Security Kconfig is not common
References: <50FFE587.4020801@gmail.com>
In-Reply-To: <50FFE587.4020801@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: winton <newtonliuwen@gmail.com>
Cc: james.l.morris@oracle.com, linux-security-module@vger.kernel.org, linux-kbuild@vger.kernel.org

On 1/23/2013 5:28 AM, winton wrote:
> Hi James,
>
>     Please help to review this patch.
>     When I analysis Kconfig files, I searched the keywork "source" and
> then follow double quotations. The Kconfig in security is missing.
> That's because security/Kconfig source keyword didn't using double
> quotations.
>     Although that's may be not necessary. But I think the same as
> other Kconfig files will be better.
>
> Best regards,
> Winton.Liu

The practice of quoting the source pathnames is usual, but far from
universal. There are several examples in the arch and drivers directories.
If you believe this is significant, see if the checkpatch maintainer is
interested in adding a check.


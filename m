Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ppsw-41.csi.cam.ac.uk ([131.111.8.141]:57288 "EHLO
	ppsw-41.csi.cam.ac.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585Ab1FYLTN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 25 Jun 2011 07:19:13 -0400
Message-ID: <4E05C0A2.20900@cam.ac.uk>
Date: Sat, 25 Jun 2011 12:04:02 +0100
From: Jonathan Cameron <jic23@cam.ac.uk>
MIME-Version: 1.0
Subject: Re: [PATCH] staging: iio light Kconfig fixlet
References: <1308986882-29183-1-git-send-email-max@stro.at>
In-Reply-To: <1308986882-29183-1-git-send-email-max@stro.at>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org

On 06/25/11 08:28, maximilian attems wrote:
> No point to start comments with '\'.
Good spot. Please send to Greg KH as it will
go through the staging tree.

Thanks,
> 
> Signed-off-by: maximilian attems <max@stro.at>
Acked-by: Jonathan Cameron <jic23@cam.ac.uk>
> ---
>  drivers/staging/iio/light/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/staging/iio/light/Kconfig b/drivers/staging/iio/light/Kconfig
> index 46d62d1..1ad2d56 100644
> --- a/drivers/staging/iio/light/Kconfig
> +++ b/drivers/staging/iio/light/Kconfig
> @@ -1,4 +1,4 @@
> -\#
> +#
>  # Light sensors
>  #
>  comment "Light sensors"


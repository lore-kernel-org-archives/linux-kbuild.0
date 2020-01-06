Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lhrrgout.huawei.com ([185.176.76.210]:2228 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725996AbgAFJSv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 04:18:51 -0500
Subject: Re: [PATCH] merge_config.sh: Add option for allmodconfig
References: <1575979754-184896-1-git-send-email-john.garry@huawei.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <7e769634-eb22-5827-e2d8-df68134056c0@huawei.com>
Date: Mon, 6 Jan 2020 09:18:47 +0000
MIME-Version: 1.0
In-Reply-To: <1575979754-184896-1-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, anders.roxell@linaro.org

On 10/12/2019 12:09, John Garry wrote:

Hi Masahiro,

Could you please consider this patch?

Thanks,
John

> Recently there has been some work in reporting and fixing bugs in booting
> an allmodconfig kernel - here are a few examples:
> 
> https://lore.kernel.org/linux-edac/304df85b-8b56-b77e-1a11-aa23769f2e7c@huawei.com/T/#t
> https://lore.kernel.org/linux-ide/bdf02e03-86a1-3d35-2908-28187f504495@huawei.com/T/#t
> https://lore.kernel.org/netdev/CADYN=9LCPfbpwdTWKw03B22-y3Text=RWXW7XP7wJBHYsMOgrA@mail.gmail.com/
> https://sourceforge.net/p/openipmi/mailman/message/36871567/
> 
> If we want to boot an allmodconfig kernel we may still want to force some
> loadable modules built-in, like UART drivers. Or just still turn off some
> configs.
> 
> So add an option to add add fragments to an allmodconfig kernel.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 63c8565206a4..01697fb6dfbe 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -23,6 +23,7 @@ clean_up() {
>   usage() {
>   	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
>   	echo "  -h    display this help text"
> +	echo "  -a    use allmodconfig instead of alldefconfig"
>   	echo "  -m    only merge the fragments, do not execute the make command"
>   	echo "  -n    use allnoconfig instead of alldefconfig"
>   	echo "  -r    list redundant entries when merging fragments"
> @@ -41,6 +42,11 @@ CONFIG_PREFIX=${CONFIG_-CONFIG_}
>   
>   while true; do
>   	case $1 in
> +	"-a")
> +		ALLTARGET=allmodconfig
> +		shift
> +		continue
> +		;;
>   	"-n")
>   		ALLTARGET=allnoconfig
>   		shift
> @@ -171,6 +177,7 @@ fi
>   
>   # Use the merged file as the starting point for:
>   # alldefconfig: Fills in any missing symbols with Kconfig default
> +# allmodconfig: Fills in any missing symbols with =m when loadable
>   # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
>   make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>   
> 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480526;
	b=0Tzp1GkvvjBkJ8VL8jbw3mv5Miy2REIym9TzKRdiRRhoQ+Vyq/LImlj5IiE08tenPbY6
	 /60tI29MNqODetzIAN1WCgcRKH74SsUhtakWwPBL3RFQBrwzi6xXXfeLIS0Z+muDkcKJt
	 WXYpbz9MOgTnIFxvXDmUHNkui6CQh/+hp7Ba2FOXxiKRvSn8hz6ey6gLG9t3pW0zEOcgZ
	 ZFpGo5o+U9dMHpPrkGWO6CvUnpNW4zW1yFdqZGO1qiymJf7lVq4ST6SzxoFm/188oiQre
	 L3YT41vmZNYlBgbYIRBJHowWAfYysydF2xltI6iZ+/3YwF8SVYgJgIk6crDGoKVhPUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480526;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GCZZaBxkFTEM5LLC3cgvS5lfHxs1vMHhsSmz+ABtnEY=;
	b=q99v/Q48CxzUeUUC3j5Erv3vIWtGM0/0fn2SWcRcZI+fGFzqnDxENPoVDxg4ZcbauJwb
	 D7O/xKkFEHUmH/TNOBOOLZ1IgcYhtjbFqXFo12U3HQhBaVvZ57VOvzxUwFaulC+ML4KFG
	 /THFGRQ+jrLSVrGwhNA39k/SI8rxB6u5U5nnvzoIGjKgOc1LX80dtyy+Qx4FZoFjfH05R
	 FgrQu/5W3qKz4o66dfThZ3+6TnDI6TlEfja93uqoDw6evhB/0GQsipZ5ryionaVEYja0g
	 b6ahxKmW/R4LTDiEsBy7NPNXBowAE6RyoX7RbnXiYg8QkP+IJrSR1abc8nTR6+Z0EGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbDZik9t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16E8606A31E
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbDZik9t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4E91F0093A;
	Sat, 31 Oct 2026 21:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480525;
	bh=GCZZaBxkFTEM5LLC3cgvS5lfHxs1vMHhsSmz+ABtnEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HbDZik9tEgWHwPhLMtV18OJ6dio8E4kSM0X462kuoThehT5gG5FSDNPqr8B4KmQNJ
	 mE9g2HvHXQD9Q7+7/DISrgb6doDUO0bVEcpsZRIc2bxPCZm/S5OVd+GF25D0z9p3fZ
	 Wu7HkTVUOcfRaBhKFGif55/S7TRSFsLP/du/5AvG3S33dte3yLPYUWt2JZpF/oAsp5
	 1x0LBz4QCqc//aECZEZC9PZd5GYnqQr6koCZ4bPmGGILbxqGmF3xyNa7D5wCSc9kXr
	 cUo8n/Sa+Em9ovMKoNlBm+Ke7zMWxXU+5AvZIR8Z4lnbNFQYF2gJ+TylJt+zuiD0jZ
	 GYDA8vVTlyzlQ==
Message-ID: <sashiko-outbox-192135@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/23] net: hpe: sbl: add the core instance and
 configuration layer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org, "Iraimani P" <iraimani.pavadai@hpe.com>, "Mamila
 Santosh" <santosh-kumar.mamila@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-3-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-3-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:04 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] net: hpe: sbl: broken chrdev and sbl_dev creation in sbl_init()
- [Medium] net: hpe: sbl: uninitialized stack sbl_media_attr in sbl_test_li=
nk_up()
- [Medium] net: hpe: sbl: error overwriting and continuation in sbl_test_li=
nk_reup()
- [Low] net: hpe: sbl: missing FEC debug flags in sbl_debug_sysfs_sprint()
- [Low] net: hpe: sbl: unlocked RMW of link->blattr.options in sbl_test_scr=
atch()
--

commit cd23412f54c7ab010584ce544a1f1f52dd8f753b
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: sbl: add the core instance and configuration layer

This patch adds SBL instance allocation and teardown, the SerDes
configuration list setup, link timing helpers, debug helpers, test routines,
and module initialization glue for HPE Slingshot Base Link NIC instances.

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_debug.c b/drivers/net/ether=
net/hpe/sbl/sbl_debug.c
> new file mode 100644
> index 0000000000000..2ddc07e6ab036
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_debug.c

[ ... ]

> +#ifdef CONFIG_SYSFS
> +int sbl_debug_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf=
, size_t size)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +	u32 debug_config =3D atomic_read(&link->debug_config);
> +	int s =3D 0;
> +
> +	if (!debug_config)
> +		return 0;
> +
> +	s +=3D scnprintf(buf + s, size - s, "base link debug: ");

[ ... ]

> +	if (debug_config & SBL_DEBUG_REMOTE_FAULT_RECOVERY)
> +		s +=3D scnprintf(buf + s, size - s, "remote-fault-recovery ");
> +
> +	if (debug_config & SBL_DEBUG_DEV0)
> +		s +=3D scnprintf(buf + s, size - s, "dev0 ");
> +	if (debug_config & SBL_DEBUG_TEST)
> +		s +=3D scnprintf(buf + s, size - s, "test ");
> +
> +	s +=3D scnprintf(buf + s, size - s, "\n");
> +
> +	return s;
> +}
> +#endif

[Severity: Low]
In include/uapi/ethernet/sbl-abi.h, enum sbl_debug_options defines three FEC
debug flags alongside SBL_DEBUG_REMOTE_FAULT_RECOVERY, SBL_DEBUG_DEV0, and
SBL_DEBUG_TEST:

	SBL_DEBUG_REMOTE_FAULT_RECOVERY   =3D (1<<26),
	SBL_DEBUG_IGNORE_HIGH_FEC_UCW     =3D (1<<27),

	SBL_DEBUG_DEV0                    =3D (1<<28),
	SBL_DEBUG_IGNORE_HIGH_FEC_TXR     =3D (1<<29),
	SBL_DEBUG_IGNORE_HIGH_FEC_CCW     =3D (1<<30),
	SBL_DEBUG_TEST                    =3D (1<<31),

When any of SBL_DEBUG_IGNORE_HIGH_FEC_UCW, SBL_DEBUG_IGNORE_HIGH_FEC_TXR, or
SBL_DEBUG_IGNORE_HIGH_FEC_CCW are set via sbl_debug_update_config(),
sbl_debug_sysfs_sprint() omits them from the formatted string, and if only
those flags are active in link->debug_config, it prints a bare
"base link debug: \n" line with no flag names.

Should sbl_debug_sysfs_sprint() format SBL_DEBUG_IGNORE_HIGH_FEC_UCW,
SBL_DEBUG_IGNORE_HIGH_FEC_TXR, and SBL_DEBUG_IGNORE_HIGH_FEC_CCW as well?

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_inst.c b/drivers/net/ethern=
et/hpe/sbl/sbl_inst.c
> new file mode 100644
> index 0000000000000..af55ac6190319
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_inst.c

[ ... ]

> +int sbl_initialise_instance(struct sbl_inst *sbl, struct sbl_instance_at=
tr *attr)
> +{
> +	unsigned long flags;
> +	int err;
> +
> +	if (!attr)
> +		return -EINVAL;
> +
> +	if (attr->magic !=3D SBL_INSTANCE_ATTR_MAGIC)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&sbl->name_lock, flags);
> +	memcpy(&sbl->iattr, attr, sizeof(struct sbl_instance_attr));
> +	spin_unlock_irqrestore(&sbl->name_lock, flags);
> +
> +	/* load the required firmware
> +	 * force load all ports if serdes firmware validation fails
> +	 */
> +	err =3D sbl_serdes_load(sbl, SBL_ALL_PORTS, false);
> +	if (err) {
> +		sbl_dev_err(sbl->dev, "initial serdes fw load failed [%d]", err);
> +		return err;
> +	}
> +	sbl_dev_err(sbl->dev, "serdes fw loaded");
> +
> +	return 0;
> +
> +}

[Severity: Medium]
When sbl_serdes_load() succeeds in sbl_initialise_instance(), normal
completion is logged using sbl_dev_err(sbl->dev, "serdes fw loaded") without
a trailing newline. Was sbl_dev_info() or sbl_dev_dbg() intended here inste=
ad
of logging at error level?

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_module_nic.c b/drivers/net/=
ethernet/hpe/sbl/sbl_module_nic.c
> new file mode 100644
> index 0000000000000..a26eb357adb6d
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_module_nic.c

[ ... ]

> +static int __init sbl_init(void)
> +{
> +	int err;
> +
> +	pr_info("%s : v%s loading (%s build)\n", module_name(THIS_MODULE),
> +		SBL_VERSION_STR, SBL_BUILD_NAME);
> +
> +	/* create a device */
> +	err =3D alloc_chrdev_region(&sbl_devt, 0, 1, DEVICE_NAME);
> +	if (err) {
> +		pr_err("%s : failed to get dev region [%d]\n",
> +		       module_name(THIS_MODULE), err);
> +		goto out;
> +	}
> +
> +		sbl_cls =3D class_create(DEVICE_NAME);
> +	if (IS_ERR(sbl_cls)) {
> +		pr_err("%s : class create failed [%ld]\n",
> +		       module_name(THIS_MODULE), PTR_ERR(sbl_cls));
> +		err =3D PTR_ERR(sbl_cls);
> +		goto out_region;
> +	}
> +
> +	sbl_dev =3D device_create(sbl_cls, NULL, sbl_devt, NULL,
> +				module_name(THIS_MODULE));
> +	if (IS_ERR(sbl_dev)) {
> +		err =3D PTR_ERR(sbl_dev);
> +		pr_err("%s : failed to add dev [%d]\n",
> +		       module_name(THIS_MODULE), err);
> +		goto out_class;
> +	}
> +
> +	return 0;
> +
> +out_class:
> +	class_destroy(sbl_cls);
> +out_region:
> +	unregister_chrdev_region(sbl_devt, 1);
> +out:
> +	return err;
> +}
> +module_init(sbl_init);
> +
> +struct device *sbl_get_device(void)
> +{
> +	return sbl_dev;
> +}

[Severity: Medium]
There appear to be several issues with how sbl_init() creates sbl_dev and h=
ow
sbl_new_instance() consumes it via sbl_get_device():

1. sbl_init() allocates a character device number with alloc_chrdev_region()
and passes sbl_devt to device_create(), which causes devtmpfs/udev to create
a character device node in /dev even though no struct cdev or file_operatio=
ns
are ever registered.

2. Because device_create() is called with module_name(THIS_MODULE) and
HPE_SBL is a tristate Kconfig option, building the driver into the kernel
(CONFIG_HPE_SBL=3Dy) makes THIS_MODULE evaluate to NULL and
module_name(THIS_MODULE) expand to "kernel", creating /dev/kernel and
/sys/class/sbl/kernel.

3. If device_create() fails in sbl_init(), sbl_dev is left holding an
ERR_PTR value. When built-in, a subsequent call to
sbl_new_instance() -> sbl_get_device() assigns that ERR_PTR to sbl->dev
without checking IS_ERR_OR_NULL(dev) and dereferences it in sbl_dev_info().

4. Every SBL instance shares this single global dummy sbl_dev for logging a=
nd
firmware loading.

Could sbl_new_instance() accept the parent hardware struct device pointer f=
rom
the caller instead of creating a shared global character device in sbl_init=
()?

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_test.c b/drivers/net/ethern=
et/hpe/sbl/sbl_test.c
> new file mode 100644
> index 0000000000000..56f9f19ae5c4e
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_test.c

[ ... ]

> +int sbl_test_link_up(struct sbl_inst *sbl, int port_num, int loopback_mo=
de)
> +{
> +	struct sbl_media_attr mattr;
> +	struct sbl_base_link_attr blattr;
> +	int blstate;
> +	int blerr;
> +	int sstate;
> +	int serr;
> +	int err;
> +
> +	err =3D sbl_validate_instance(sbl);
> +	if (err)
> +		return err;
> +
> +	dev_dbg(sbl->dev, "%s starting\n", __func__);
> +
> +	err =3D sbl_validate_port_num(sbl, port_num);
> +	if (err)
> +		return err;
> +
> +	/* configure media */
> +	mattr.magic =3D SBL_MEDIA_ATTR_MAGIC;
> +	mattr.media =3D SBL_LINK_MEDIA_ELECTRICAL;
> +	mattr.len   =3D 2;
> +
> +	err =3D sbl_media_config(sbl, port_num, &mattr);
> +	if (err) {
> +		dev_err(sbl->dev, "%d: media config failed [%d]\n", port_num, err);
> +		goto out;
> +	}
> +
> +	/* configure base-link */
> +	sbl_blattr_init(&blattr, loopback_mode);
> +
> +	err =3D sbl_base_link_config(sbl, port_num, &blattr);
> +	if (err) {
> +		dev_err(sbl->dev, "%d: base link config failed [%d]\n", port_num, err);
> +		goto out;
> +	}
> +
> +	/* start the base link */
> +	err =3D sbl_base_link_start(sbl, port_num);
> +	if (err)
> +		dev_err(sbl->dev, "%d: base link start failed [%d]\n", port_num, err);
> +
> +out:
> +	sbl_base_link_get_status(sbl, port_num, &blstate, &blerr, &sstate, &ser=
r, NULL, NULL);
> +	dev_info(sbl->dev, "%d: base link %s (%d), serdes %s (%d)\n", port_num,
> +		 sbl_link_state_str(blstate), blerr,
> +		 sbl_serdes_state_str(sstate), serr);
> +
> +	return err;
> +}

[Severity: Medium]
In sbl_test_link_up(), mattr is declared on the stack without initializatio=
n,
and only mattr.magic, mattr.media, and mattr.len are populated before passi=
ng
&mattr to sbl_media_config():

include/uapi/ethernet/sbl-abi.h:
struct sbl_media_attr {
	__u32 magic;
	__u32 media;   /**< The link media type */
	__u64 len;     /**< Cable length */
	__u32 info;    /**< Additional information flags */
	__u32 vendor;  /**< Cable vendor info */
};

Because mattr.info and mattr.vendor contain uninitialized stack data,
sbl_media_config() copies them into link->mattr. If mattr.info is non-zero
and lacks SBL_MEDIA_INFO_SUPPORTS_BS_200G, sbl_media_check_mode_supported()
will reject BS_200G during sbl_base_link_start(), and sbl_media_sysfs_sprin=
t()
will expose the uninitialized vendor and info values.

In addition, both sbl_test_link_up() and sbl_test_link_down() declare
blstate, blerr, sstate, and serr uninitialized on the stack and log them
after calling sbl_base_link_get_status() without checking whether
sbl_base_link_get_status() succeeded.

Should mattr (and the status variables in sbl_test_link_up() and
sbl_test_link_down()) be zero-initialized before use?

> +
> +/**
> + * sbl_test_link_reup() - Test to link reup
> + * @sbl: A slingshot base link device instance
> + * @port_num: port number
> + * @loopback_mode: selected enum value of loopback mode
> + *
> + * This function is used to test base link
> + * operation of start/stop.
> + *
> + * Return: 0 on success, error on failure
> + */
> +int sbl_test_link_reup(struct sbl_inst *sbl, int port_num, int loopback_=
mode)
> +{
> +	struct sbl_base_link_attr blattr;
> +	int err;
> +
> +	err =3D sbl_validate_instance(sbl);
> +	if (err)
> +		return err;
> +
> +	dev_dbg(sbl->dev, "%s starting\n", __func__);
> +
> +	err =3D sbl_validate_port_num(sbl, port_num);
> +	if (err)
> +		return err;
> +
> +	sbl_blattr_init(&blattr, loopback_mode);
> +
> +	err =3D sbl_base_link_config(sbl, port_num, &blattr);
> +	if (err)
> +		dev_err(sbl->dev, "%d: base link config failed [%d]\n", port_num, err);
> +
> +	err =3D sbl_base_link_start(sbl, port_num);
> +	if (err)
> +		dev_err(sbl->dev, "%d: base link start failed [%d]\n", port_num, err);
> +
> +	err =3D sbl_base_link_stop(sbl, port_num);
> +	if (err)
> +		dev_err(sbl->dev, "%d: base link stop failed [%d]\n", port_num, err);
> +
> +	err =3D sbl_base_link_start(sbl, port_num);
> +	if (err)
> +		dev_err(sbl->dev, "%d: base link start failed [%d]\n", port_num, err);
> +
> +	return err;
> +}

[Severity: Medium]
If sbl_base_link_config(), the first sbl_base_link_start(), or
sbl_base_link_stop() fails in sbl_test_link_reup(), the function logs the
error but continues executing the remaining start/stop steps and overwrites
err. Should sbl_test_link_reup() return early on error like
sbl_test_link_up() does?

[ ... ]

> +int sbl_test_scratch(struct sbl_inst *sbl, int port_num)
> +{
> +	struct sbl_link *link;
> +	int err =3D 0;
> +
> +	err =3D sbl_validate_instance(sbl);
> +	if (err)
> +		return err;
> +
> +	dev_dbg(sbl->dev, "%s toggling reload serdes fw option\n", __func__);
> +
> +	err =3D sbl_validate_port_num(sbl, port_num);
> +	if (err)
> +		return err;
> +
> +	link =3D sbl->link + port_num;
> +
> +	if (link->blattr.options & SBL_OPT_RELOAD_FW_ON_TIMEOUT)
> +		link->blattr.options &=3D ~SBL_OPT_RELOAD_FW_ON_TIMEOUT;
> +	else
> +		link->blattr.options |=3D SBL_OPT_RELOAD_FW_ON_TIMEOUT;
> +
> +	return err;
> +}

[Severity: Low]
Other functions that modify link->blattr.options (such as
sbl_base_link_config(), sbl_ignore_save_tuning_param(),
sbl_enable_opt_lane_degrade(), and sbl_disable_pml_recovery()) serialize
updates under link->lock. Should sbl_test_scratch() also hold link->lock
when toggling SBL_OPT_RELOAD_FW_ON_TIMEOUT in link->blattr.options?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D3
